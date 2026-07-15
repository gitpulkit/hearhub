import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';
import '../l10n/app_localizations.dart';
import '../theme/app_colors.dart';
import '../widgets/mobile_layout.dart';
import '../widgets/bottom_nav.dart';
import '../data/tools_data.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  String _query = '';

  final List<String> _recentSearches = [
    'Live Transcribe app',
    'Hearing aid sync',
    'LED flash alerts',
    'Noisy restaurant tips',
  ];

  static const _categories = [
    (label: 'Transcription', icon: LucideIcons.users, isSecondary: true),
    (label: 'Alerts', icon: LucideIcons.bell, isSecondary: false),
    (label: 'Dining', icon: LucideIcons.utensils, isSecondary: true),
    (label: 'Work', icon: LucideIcons.briefcase, isSecondary: false),
    (label: 'Devices', icon: LucideIcons.headphones, isSecondary: true),
  ];

  /// Tools that match the current query
  List<ToolItem> get _suggestions {
    if (_query.isEmpty) return [];
    final q = _query.toLowerCase();
    return allTools
        .where((t) =>
            t.name.toLowerCase().contains(q) ||
            t.tagline.toLowerCase().contains(q) ||
            t.category.toLowerCase().contains(q))
        .toList();
  }

  void _navigateToTool(ToolItem tool) {
    // Add to recent searches if not already present
    final entry = tool.name;
    setState(() {
      _recentSearches.remove(entry);
      _recentSearches.insert(0, entry);
      if (_recentSearches.length > 6) _recentSearches.removeLast();
    });
    _controller.clear();
    setState(() => _query = '');
    _focusNode.unfocus();
    context.push('/tool/${tool.id}');
  }

  void _onSubmitted(String value) {
    final suggestions = _suggestions;
    if (suggestions.isNotEmpty) {
      _navigateToTool(suggestions.first);
    }
  }

  void _removeRecent(int index) {
    setState(() => _recentSearches.removeAt(index));
  }

  void _clearAll() {
    setState(() => _recentSearches.clear());
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() => _query = _controller.text);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final suggestions = _suggestions;
    final isSearching = _query.isNotEmpty;

    return MobileLayout(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Search',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: AppColors.foreground(context),
                  ),
                ),
                const SizedBox(height: 20),

                // ── Search bar (anchored) ─────────────────────────
                Material(
                  color: AppColors.card(context),
                  borderRadius: BorderRadius.circular(32),
                  elevation: 2,
                  shadowColor: Colors.black.withValues(alpha: 0.06),
                  child: TextField(
                    controller: _controller,
                    focusNode: _focusNode,
                    onSubmitted: _onSubmitted,
                    textInputAction: TextInputAction.search,
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.foreground(context),
                    ),
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context).searchHint,
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: AppColors.mutedForeground(context),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 16, right: 8),
                        child: Icon(
                          LucideIcons.search,
                          size: 20,
                          color: AppColors.mutedForeground(context),
                        ),
                      ),
                      prefixIconConstraints: const BoxConstraints(
                        minWidth: 0,
                        minHeight: 0,
                      ),
                      suffixIcon: isSearching
                          ? IconButton(
                              icon: Icon(LucideIcons.x,
                                  size: 16,
                                  color: AppColors.mutedForeground(context)),
                              onPressed: () {
                                _controller.clear();
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
                        horizontal: 16,
                        vertical: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                // ── Scrollable content region only ────────────────
                Expanded(
                  child: isSearching
                      ? ListView(
                          padding: const EdgeInsets.only(bottom: 120),
                          children: [
                            if (suggestions.isEmpty)
                              _NoResultsTile(query: _query)
                            else
                              Material(
                                color: AppColors.card(context),
                                borderRadius: BorderRadius.circular(20),
                                elevation: 3,
                                shadowColor: Colors.black.withValues(alpha: 0.07),
                                child: Column(
                                  children: List.generate(suggestions.length, (i) {
                                    final tool = suggestions[i];
                                    final isLast = i == suggestions.length - 1;
                                    return _SuggestionTile(
                                      tool: tool,
                                      isLast: isLast,
                                      onTap: () => _navigateToTool(tool),
                                    );
                                  }),
                                ),
                              ),
                          ],
                        )
                      : ListView(
                          padding: const EdgeInsets.only(top: 24, bottom: 120),
                          children: [
                            // Popular Categories
                            const _SectionLabel('Popular Categories'),
                            const SizedBox(height: 16),
                            Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              children: _categories.map((c) {
                                return _CategoryChip(
                                  label: c.label,
                                  icon: c.icon,
                                  isSecondary: c.isSecondary,
                                );
                              }).toList(),
                            ),
                            const SizedBox(height: 32),

                            // Recent Searches header
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const _SectionLabel('Recent Searches'),
                                if (_recentSearches.isNotEmpty)
                                  GestureDetector(
                                    onTap: _clearAll,
                                    child: Text(
                                      'Clear all',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.primary(context),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            if (_recentSearches.isEmpty)
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 16),
                                child: Text(
                                  'No recent searches',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.mutedForeground(context),
                                  ),
                                ),
                              )
                            else
                              ...List.generate(_recentSearches.length, (i) {
                                return _RecentSearchRow(
                                  label: _recentSearches[i],
                                  onRemove: () => _removeRecent(i),
                                  onTap: () {
                                    _controller.text = _recentSearches[i];
                                    setState(() => _query = _recentSearches[i]);
                                  },
                                );
                              }),
                          ],
                        ),
                ),
              ],
            ),
          ),

          // Bottom nav
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

class _SectionLabel extends StatelessWidget {
  const _SectionLabel(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.4,
        color: AppColors.mutedForeground(context),
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  const _CategoryChip({
    required this.label,
    required this.icon,
    required this.isSecondary,
  });

  final String label;
  final IconData icon;
  final bool isSecondary;

  @override
  Widget build(BuildContext context) {
    final bgColor = isSecondary ? AppColors.secondary(context) : AppColors.accent(context);
    final iconColor = isSecondary ? AppColors.primary(context) : AppColors.foreground(context);

    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(999),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16, color: iconColor),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: iconColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RecentSearchRow extends StatelessWidget {
  const _RecentSearchRow({
    required this.label,
    required this.onRemove,
    this.onTap,
  });

  final String label;
  final VoidCallback onRemove;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Icon(
              LucideIcons.history,
              size: 18,
              color: AppColors.mutedForeground(context),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors.foreground(context),
                ),
              ),
            ),
            GestureDetector(
              onTap: onRemove,
              child: Icon(
                LucideIcons.x,
                size: 16,
                color: AppColors.mutedForeground(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Suggestion tile shown inside the live dropdown ────────────────────────────

class _SuggestionTile extends StatelessWidget {
  const _SuggestionTile({
    required this.tool,
    required this.onTap,
    this.isLast = false,
  });

  final ToolItem tool;
  final VoidCallback onTap;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final iconBg =
        tool.isSecondaryIcon ? AppColors.secondary(context) : AppColors.accent(context);
    final iconColor =
        tool.isSecondaryIcon ? AppColors.primary(context) : AppColors.foreground(context);

    return InkWell(
      onTap: onTap,
      borderRadius: isLast
          ? const BorderRadius.vertical(bottom: Radius.circular(20))
          : BorderRadius.zero,
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: iconBg,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(tool.icon, size: 18, color: iconColor),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tool.name,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.foreground(context),
                        ),
                      ),
                      Text(
                        tool.tagline,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 11,
                          color: AppColors.mutedForeground(context),
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  LucideIcons.arrow_right,
                  size: 14,
                  color: AppColors.mutedForeground(context),
                ),
              ],
            ),
          ),
          if (!isLast)
            Divider(
              height: 1,
              indent: 68,
              color: AppColors.border(context),
            ),
        ],
      ),
    );
  }
}

// ── No results tile ───────────────────────────────────────────────────────────

class _NoResultsTile extends StatelessWidget {
  const _NoResultsTile({required this.query});
  final String query;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.card(context),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(LucideIcons.search_x,
              size: 18, color: AppColors.mutedForeground(context)),
          const SizedBox(width: 12),
          Text(
            'No tools found for "$query"',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.mutedForeground(context),
            ),
          ),
        ],
      ),
    );
  }
}
