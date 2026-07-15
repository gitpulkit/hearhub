import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import '../l10n/app_localizations.dart';
import '../theme/app_colors.dart';
import '../widgets/mobile_layout.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/hearhub_button.dart';

class ToolItem {
  final String id;
  final String category;
  final String tag;
  final String title;
  final String desc;
  final String cta;

  ToolItem({
    required this.id,
    required this.category,
    required this.tag,
    required this.title,
    required this.desc,
    required this.cta,
  });
}

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  String activeFilter = 'all';

  final List<ToolItem> allTools = [
    ToolItem(id: 'live-transcribe', category: 'all', tag: 'TECH TOOL', title: 'Live Transcribe Pro', desc: 'Real-time speech-to-text with noise cancellation for loud spaces.', cta: 'Open Tool'),
    ToolItem(id: 'airport-guide', category: 'all', tag: 'ARTICLE', title: 'Airport Navigation Guide', desc: 'Tips for visual boarding cues and gate announcements.', cta: 'Read Article'),
    ToolItem(id: 'asl-signs', category: 'all', tag: 'EDUCATION', title: 'Emergency ASL Signs', desc: 'Quick visual guide for critical communication signs.', cta: 'View Guide'),
    ToolItem(id: 'reddit-accessible', category: 'apps', tag: 'APP', title: 'Reddit Accessible', desc: 'Screen reader optimized interface for Reddit browsing.', cta: 'Download App'),
    ToolItem(id: 'voicebase', category: 'apps', tag: 'APP', title: 'VoiceBase', desc: 'Voice-to-text transcription and organization tool.', cta: 'Open App'),
    ToolItem(id: 'hearing-spectrum', category: 'articles', tag: 'ARTICLE', title: 'Understanding the Hearing Spectrum', desc: 'Learn about different types of hearing loss and solutions.', cta: 'Read Article'),
    ToolItem(id: 'asl-basics', category: 'articles', tag: 'ARTICLE', title: 'ASL Basics for Beginners', desc: 'Introduction to American Sign Language fundamentals.', cta: 'Read Article'),
    ToolItem(id: 'navigation-guide', category: 'guides', tag: 'GUIDE', title: 'Public Transit Navigation Guide', desc: 'Tips for using public transportation confidently.', cta: 'View Guide'),
    ToolItem(id: 'workplace-guide', category: 'guides', tag: 'GUIDE', title: 'Workplace Accommodations Guide', desc: 'How to request and implement workplace accommodations.', cta: 'View Guide'),
  ];

  List<ToolItem> getFilteredTools() {
    if (activeFilter == 'all') {
      return allTools;
    }
    return allTools.where((tool) => tool.category == activeFilter).toList();
  }

  Widget _filterPill(String text, String filterValue, {bool active = false}) => GestureDetector(
        onTap: () => setState(() => activeFilter = filterValue),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: active ? AppColors.primary(context) : AppColors.card(context),
            borderRadius: BorderRadius.circular(999),
          ),
          constraints: const BoxConstraints(minHeight: 40),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(fontSize: 14, color: active ? AppColors.primaryForeground(context) : AppColors.foreground(context), fontWeight: FontWeight.w600),
          ),
        ),
      );

  Widget _savedCard(BuildContext context, String tag, String title, String desc, String cta) {
    return Container(
      decoration: BoxDecoration(color: AppColors.card(context), borderRadius: BorderRadius.circular(18), boxShadow: [
        BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 8, offset: const Offset(0, 4)),
      ]),
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6), decoration: BoxDecoration(color: AppColors.secondary(context), borderRadius: BorderRadius.circular(8)), child: Text(tag, style: TextStyle(fontSize: 12, color: AppColors.primary(context)))),
              IconButton(onPressed: () {}, icon: Icon(LucideIcons.bookmark, color: AppColors.mutedForeground(context))),
            ],
          ),
          const SizedBox(height: 8),
          Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.foreground(context))),
          const SizedBox(height: 10),
          Text(desc, style: TextStyle(fontSize: 14, color: AppColors.mutedForeground(context))),
          const SizedBox(height: 14),
          Row(children: [
            Expanded(child: HearHubButton(onPressed: () {}, minHeight: 48, borderRadius: 16, child: Text(cta))),
          ]),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredTools = getFilteredTools();
    
    return MobileLayout(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 20, bottom: 140),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Text(AppLocalizations.of(context).savedTools, style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: AppColors.foreground(context))),
                  const SizedBox(height: 6),
                  Text('Your toolkit for any situation.', style: TextStyle(fontSize: 14, color: AppColors.mutedForeground(context))),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 56,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(children: [
                        _filterPill('All Tools', 'all', active: activeFilter == 'all'),
                        const SizedBox(width: 12),
                        _filterPill('Articles', 'articles', active: activeFilter == 'articles'),
                        const SizedBox(width: 12),
                        _filterPill('Apps', 'apps', active: activeFilter == 'apps'),
                        const SizedBox(width: 12),
                        _filterPill('Guides', 'guides', active: activeFilter == 'guides'),
                      ]),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ...filteredTools.map((tool) => 
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: _savedCard(context, tool.tag, tool.title, tool.desc, tool.cta),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(left: 0, right: 0, bottom: 0, child: const BottomNav()),
        ],
      ),
    );
  }
}
