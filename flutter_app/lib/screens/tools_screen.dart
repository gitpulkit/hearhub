import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';
import '../utils/navigation.dart';
import '../widgets/mobile_layout.dart';
import '../widgets/bottom_nav.dart';
import '../data/tools_data.dart';

class ToolsScreen extends StatefulWidget {
  const ToolsScreen({super.key, this.scenario});

  /// Optional scenario context passed via query param e.g. ?scenario=restaurant
  final String? scenario;

  @override
  State<ToolsScreen> createState() => _ToolsScreenState();
}

class _ToolsScreenState extends State<ToolsScreen> {
  final _searchController = TextEditingController();
  String _query = '';
  String _activeCategory = 'all';
  late String? _activeScenario;

  @override
  void initState() {
    super.initState();
    _activeScenario = widget.scenario;
    _searchController.addListener(() {
      setState(() => _query = _searchController.text.toLowerCase());
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<ToolItem> get _filtered {
    var tools = allTools.toList();

    // Scenario-aware: relevant tools float to top, rest still shown
    if (_activeScenario != null) {
      final relevant =
          tools.where((t) => t.scenarios.contains(_activeScenario)).toList();
      final rest =
          tools.where((t) => !t.scenarios.contains(_activeScenario)).toList();
      tools = [...relevant, ...rest];
    }

    // Category filter
    if (_activeCategory != 'all') {
      tools = tools.where((t) => t.category == _activeCategory).toList();
    }

    // Search query
    if (_query.isNotEmpty) {
      tools = tools
          .where((t) =>
              t.name.toLowerCase().contains(_query) ||
              t.tagline.toLowerCase().contains(_query) ||
              t.category.toLowerCase().contains(_query))
          .toList();
    }

    return tools;
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _filtered;
    final meta = _activeScenario != null
        ? scenarioMeta[_activeScenario]
        : null;

    return MobileLayout(
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Header ──────────────────────────────────────────
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 32, 24, 0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => context.popOrGo('/dashboard'),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColors.secondary,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          LucideIcons.arrow_left,
                          size: 20,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Text(
                      'All Tools',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: AppColors.foreground,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '${filtered.length} tools',
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.mutedForeground,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // ── Search bar ──────────────────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Material(
                  color: AppColors.card,
                  borderRadius: BorderRadius.circular(32),
                  elevation: 2,
                  shadowColor: Colors.black.withValues(alpha: 0.05),
                  child: TextField(
                    controller: _searchController,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.foreground,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Search tools...',
                      hintStyle: const TextStyle(
                        fontSize: 14,
                        color: AppColors.mutedForeground,
                      ),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(left: 16, right: 8),
                        child: Icon(
                          LucideIcons.search,
                          size: 18,
                          color: AppColors.mutedForeground,
                        ),
                      ),
                      prefixIconConstraints:
                          const BoxConstraints(minWidth: 0, minHeight: 0),
                      suffixIcon: _query.isNotEmpty
                          ? IconButton(
                              icon: const Icon(LucideIcons.x,
                                  size: 16, color: AppColors.mutedForeground),
                              onPressed: () {
                                _searchController.clear();
                                setState(() => _query = '');
                              },
                            )
                          : null,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: AppColors.card,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 14),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 14),

              // ── Scenario banner ─────────────────────────────────
              if (_activeScenario != null && meta != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 10),
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(meta.icon,
                            size: 16, color: AppColors.primary),
                        const SizedBox(width: 8),
                        Text(
                          'Showing tools for ${meta.label}',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () =>
                              setState(() => _activeScenario = null),
                          child: const Icon(LucideIcons.x,
                              size: 14, color: AppColors.primary),
                        ),
                      ],
                    ),
                  ),
                ),

              if (_activeScenario != null) const SizedBox(height: 12),

              // ── Category filter chips ───────────────────────────
              SizedBox(
                height: 44,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  children: categoryLabels.entries.map((entry) {
                    final isActive = _activeCategory == entry.key;
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: GestureDetector(
                        onTap: () =>
                            setState(() => _activeCategory = entry.key),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 150),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 10),
                          decoration: BoxDecoration(
                            color: isActive
                                ? AppColors.primary
                                : AppColors.card,
                            borderRadius: BorderRadius.circular(999),
                            border: Border.all(
                              color: isActive
                                  ? AppColors.primary
                                  : AppColors.border,
                            ),
                          ),
                          child: Text(
                            entry.value,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: isActive
                                  ? AppColors.primaryForeground
                                  : AppColors.foreground,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),

              const SizedBox(height: 16),

              // ── Tool list ───────────────────────────────────────
              Expanded(
                child: filtered.isEmpty
                    ? _EmptyState(query: _query)
                    : ListView.separated(
                        padding: const EdgeInsets.fromLTRB(24, 0, 24, 120),
                        itemCount: filtered.length,
                        separatorBuilder: (_, __) =>
                            const SizedBox(height: 12),
                        itemBuilder: (context, i) {
                          final tool = filtered[i];
                          final isHighlighted = _activeScenario != null &&
                              tool.scenarios.contains(_activeScenario);
                          return _ToolCard(
                            tool: tool,
                            isHighlighted: isHighlighted,
                            onTap: () => context.push('/tool/${tool.id}'),
                          );
                        },
                      ),
              ),
            ],
          ),

          // ── Bottom nav ──────────────────────────────────────────
          const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: BottomNav(),
          ),
        ],
      ),
    );
  }
}

// ── Tool Card ────────────────────────────────────────────────────────────────

class _ToolCard extends StatelessWidget {
  const _ToolCard({
    required this.tool,
    required this.onTap,
    this.isHighlighted = false,
  });

  final ToolItem tool;
  final VoidCallback onTap;
  final bool isHighlighted;

  @override
  Widget build(BuildContext context) {
    final iconBg =
        tool.isSecondaryIcon ? AppColors.secondary : AppColors.accent;
    final iconColor =
        tool.isSecondaryIcon ? AppColors.primary : AppColors.foreground;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isHighlighted ? AppColors.primary : AppColors.border,
            width: isHighlighted ? 1.5 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Icon
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: iconBg,
                shape: BoxShape.circle,
              ),
              child: Icon(tool.icon, size: 24, color: iconColor),
            ),
            const SizedBox(width: 14),

            // Text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          tool.name,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: AppColors.foreground,
                          ),
                        ),
                      ),
                      _CategoryBadge(category: tool.category),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    tool.tagline,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.mutedForeground,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 10),

            // Arrow
            const Icon(
              LucideIcons.chevron_right,
              size: 18,
              color: AppColors.mutedForeground,
            ),
          ],
        ),
      ),
    );
  }
}

// ── Category Badge ────────────────────────────────────────────────────────────

class _CategoryBadge extends StatelessWidget {
  const _CategoryBadge({required this.category});
  final String category;

  @override
  Widget build(BuildContext context) {
    final label = categoryLabels[category] ?? category;
    final isDevice = category == 'device';
    final isGuide = category == 'guide';

    final bg = isDevice
        ? AppColors.accent
        : isGuide
            ? const Color(0xFFE8F4F0)
            : AppColors.secondary;
    final fg = isDevice
        ? AppColors.foreground
        : isGuide
            ? const Color(0xFF3A8A6A)
            : AppColors.primary;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: fg,
          letterSpacing: 0.4,
        ),
      ),
    );
  }
}

// ── Empty State ───────────────────────────────────────────────────────────────

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.query});
  final String query;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: const BoxDecoration(
                color: AppColors.secondary,
                shape: BoxShape.circle,
              ),
              child: const Icon(LucideIcons.search_x,
                  size: 32, color: AppColors.primary),
            ),
            const SizedBox(height: 20),
            Text(
              query.isNotEmpty
                  ? 'No tools match "$query"'
                  : 'No tools in this category',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.foreground,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Try a different search or category.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: AppColors.mutedForeground,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
