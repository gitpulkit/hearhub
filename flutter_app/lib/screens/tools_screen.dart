import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';
import '../l10n/app_localizations.dart';
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

  Map<String, String> _localizedCategories(AppLocalizations l10n) => {
        'all': l10n.categoryAll,
        'app': l10n.categoryApps,
        'device': l10n.categoryDevices,
        'guide': l10n.categoryGuides,
      };

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final categories = _localizedCategories(l10n);
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
                          color: AppColors.secondary(context),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          LucideIcons.arrow_left,
                          size: 20,
                          color: AppColors.primary(context),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      l10n.allTools,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: AppColors.foreground(context),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      l10n.toolsCount(filtered.length),
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.mutedForeground(context),
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
                  color: AppColors.card(context),
                  borderRadius: BorderRadius.circular(32),
                  elevation: 2,
                  shadowColor: Colors.black.withValues(alpha: 0.05),
                  child: TextField(
                    controller: _searchController,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.foreground(context),
                    ),
                    decoration: InputDecoration(
                      hintText: l10n.searchToolsHint,
                      hintStyle: TextStyle(
                        fontSize: 14,
                        color: AppColors.mutedForeground(context),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 16, right: 8),
                        child: Icon(
                          LucideIcons.search,
                          size: 18,
                          color: AppColors.mutedForeground(context),
                        ),
                      ),
                      prefixIconConstraints:
                          const BoxConstraints(minWidth: 0, minHeight: 0),
                      suffixIcon: _query.isNotEmpty
                          ? IconButton(
                              icon: Icon(LucideIcons.x,
                                  size: 16, color: AppColors.mutedForeground(context)),
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
                      fillColor: AppColors.card(context),
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
                      color: AppColors.secondary(context),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(meta.icon,
                            size: 16, color: AppColors.primary(context)),
                        const SizedBox(width: 8),
                        Text(
                          'Showing tools for ${meta.label}',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary(context),
                          ),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () =>
                              setState(() => _activeScenario = null),
                          child: Icon(LucideIcons.x,
                              size: 14, color: AppColors.primary(context)),
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
                  children: categories.entries.map((entry) {
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
                                ? AppColors.primary(context)
                                : AppColors.card(context),
                            borderRadius: BorderRadius.circular(999),
                            border: Border.all(
                              color: isActive
                                  ? AppColors.primary(context)
                                  : AppColors.border(context),
                            ),
                          ),
                          child: Text(
                            entry.value,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: isActive
                                  ? AppColors.primaryForeground(context)
                                  : AppColors.foreground(context),
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
        tool.isSecondaryIcon ? AppColors.secondary(context) : AppColors.accent(context);
    final iconColor =
        tool.isSecondaryIcon ? AppColors.primary(context) : AppColors.foreground(context);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.card(context),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isHighlighted ? AppColors.primary(context) : AppColors.border(context),
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
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: AppColors.foreground(context),
                          ),
                        ),
                      ),
                      _CategoryBadge(category: tool.category),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    tool.tagline,
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.mutedForeground(context),
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 10),

            // Arrow
            Icon(
              LucideIcons.chevron_right,
              size: 18,
              color: AppColors.mutedForeground(context),
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
    final l10n = AppLocalizations.of(context);
    final labels = {
      'all': l10n.categoryAll,
      'app': l10n.categoryApps,
      'device': l10n.categoryDevices,
      'guide': l10n.categoryGuides,
    };
    final label = labels[category] ?? category;
    final isDevice = category == 'device';
    final isGuide = category == 'guide';

    final bg = isDevice
        ? AppColors.accent(context)
        : isGuide
            ? const Color(0xFFE8F4F0)
            : AppColors.secondary(context);
    final fg = isDevice
        ? AppColors.foreground(context)
        : isGuide
            ? const Color(0xFF3A8A6A)
            : AppColors.primary(context);

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
              decoration: BoxDecoration(
                color: AppColors.secondary(context),
                shape: BoxShape.circle,
              ),
              child: Icon(LucideIcons.search_x,
                  size: 32, color: AppColors.primary(context)),
            ),
            const SizedBox(height: 20),
            Text(
              query.isNotEmpty
                  ? 'No tools match "$query"'
                  : 'No tools in this category',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.foreground(context),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Try a different search or category.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: AppColors.mutedForeground(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
