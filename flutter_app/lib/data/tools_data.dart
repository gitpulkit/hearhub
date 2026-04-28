import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

/// Canonical tool model used across /tools, /tool/:toolId, dashboard, etc.
class ToolItem {
  const ToolItem({
    required this.id,
    required this.name,
    required this.tagline,
    required this.icon,
    required this.category,
    required this.scenarios,
    this.isSecondaryIcon = true,
  });

  final String id;
  final String name;
  final String tagline;
  final IconData icon;

  /// 'app' | 'device' | 'guide'
  final String category;

  /// scenario ids this tool is relevant to: restaurant, meeting, classroom, home
  final List<String> scenarios;

  /// true = secondary (purple tint), false = accent (pink tint)
  final bool isSecondaryIcon;
}

const List<ToolItem> allTools = [
  ToolItem(
    id: 'sound-amplifier',
    name: 'Sound Amplifier',
    tagline: 'Boost sounds around you in real time.',
    icon: LucideIcons.volume_2,
    category: 'app',
    scenarios: ['restaurant', 'home', 'meeting'],
    isSecondaryIcon: true,
  ),
  ToolItem(
    id: 'noise-reducer',
    name: 'Noise Reducer',
    tagline: 'Filter background noise so voices stand out.',
    icon: LucideIcons.headphones,
    category: 'app',
    scenarios: ['restaurant', 'meeting', 'home'],
    isSecondaryIcon: false,
  ),
  ToolItem(
    id: 'live-transcribe',
    name: 'Live Transcribe',
    tagline: 'Real-time speech-to-text for lectures and meetings.',
    icon: LucideIcons.mic,
    category: 'app',
    scenarios: ['classroom', 'meeting'],
    isSecondaryIcon: true,
  ),
  ToolItem(
    id: 'hearing-test-pro',
    name: 'Hearing Test Pro',
    tagline: 'Check your hearing health in minutes.',
    icon: LucideIcons.ear,
    category: 'app',
    scenarios: ['home'],
    isSecondaryIcon: false,
  ),
  ToolItem(
    id: 'otter-ai',
    name: 'Otter.ai',
    tagline: 'AI-powered note-taking from spoken words.',
    icon: LucideIcons.file_text,
    category: 'app',
    scenarios: ['classroom', 'meeting'],
    isSecondaryIcon: true,
  ),
  ToolItem(
    id: 'caption-call',
    name: 'CaptionCall',
    tagline: 'Automatically captions every phone call.',
    icon: LucideIcons.phone,
    category: 'app',
    scenarios: ['home'],
    isSecondaryIcon: false,
  ),
  ToolItem(
    id: 'roger-pen',
    name: 'Roger Pen',
    tagline: 'Directional mic that streams directly to hearing aids.',
    icon: LucideIcons.mic_vocal,
    category: 'device',
    scenarios: ['restaurant', 'meeting', 'classroom'],
    isSecondaryIcon: true,
  ),
  ToolItem(
    id: 'alertmaster',
    name: 'AlertMaster',
    tagline: 'Visual and vibrating alerts for home sounds.',
    icon: LucideIcons.bell,
    category: 'device',
    scenarios: ['home'],
    isSecondaryIcon: false,
  ),
  ToolItem(
    id: 'hearing-loop-guide',
    name: 'Hearing Loop Guide',
    tagline: 'How to use hearing loops in public venues.',
    icon: LucideIcons.info,
    category: 'guide',
    scenarios: ['restaurant', 'classroom'],
    isSecondaryIcon: true,
  ),
  ToolItem(
    id: 'workplace-guide',
    name: 'Workplace Accommodations',
    tagline: 'Know your rights and get the right support at work.',
    icon: LucideIcons.briefcase,
    category: 'guide',
    scenarios: ['meeting'],
    isSecondaryIcon: false,
  ),
  ToolItem(
    id: 'envision-app',
    name: 'Envision App',
    tagline:
        'Uses OCR to read text aloud and describe surroundings for easier access.',
    icon: LucideIcons.scan_text,
    category: 'app',
    scenarios: ['classroom', 'home'],
    isSecondaryIcon: true,
  ),
  ToolItem(
    id: 'u-signup-application',
    name: 'U-Signup Application',
    tagline:
        'Uganda Sign Language learning support for clearer communication.',
    icon: LucideIcons.languages,
    category: 'app',
    scenarios: ['classroom', 'home', 'meeting'],
    isSecondaryIcon: false,
  ),
  ToolItem(
    id: 'wulira-app',
    name: 'Wulira App',
    tagline:
        'Mobile audiometry for early hearing-loss screening and awareness.',
    icon: LucideIcons.ear,
    category: 'app',
    scenarios: ['classroom', 'meeting', 'home'],
    isSecondaryIcon: true,
  ),
  ToolItem(
    id: 'unad-support-programs',
    name: 'UNAD Support Programs',
    tagline:
        'Educational support, sign-language training, and vocational guidance.',
    icon: LucideIcons.graduation_cap,
    category: 'guide',
    scenarios: ['classroom', 'meeting', 'home'],
    isSecondaryIcon: false,
  ),
  ToolItem(
    id: 'zoom-teams-live-captions',
    name: 'Zoom / Microsoft Teams Live Captions',
    tagline:
        'Built-in captions and transcripts for virtual workplace meetings.',
    icon: LucideIcons.captions,
    category: 'app',
    scenarios: ['meeting', 'classroom'],
    isSecondaryIcon: true,
  ),
  ToolItem(
    id: 'hearwho-app',
    name: 'HearWHO App',
    tagline:
        'WHO hearing screening app to support early hearing intervention.',
    icon: LucideIcons.shield_check,
    category: 'app',
    scenarios: ['home', 'classroom'],
    isSecondaryIcon: false,
  ),
  ToolItem(
    id: 'baby-sign-language-dictionary',
    name: 'Baby Sign Language Dictionary',
    tagline:
        'Learn basic sign language to support early child communication.',
    icon: LucideIcons.book_open,
    category: 'app',
    scenarios: ['home', 'classroom'],
    isSecondaryIcon: true,
  ),
  ToolItem(
    id: 'avaz-aac-app',
    name: 'AVAZ AAC App',
    tagline:
        'Picture-based communication support for children and caregivers.',
    icon: LucideIcons.message_square_text,
    category: 'app',
    scenarios: ['home', 'classroom'],
    isSecondaryIcon: false,
  ),
];

/// Scenario display metadata
class ScenarioMeta {
  const ScenarioMeta({required this.label, required this.icon});
  final String label;
  final IconData icon;
}

const Map<String, ScenarioMeta> scenarioMeta = {
  'restaurant': ScenarioMeta(label: 'Restaurant', icon: LucideIcons.utensils),
  'meeting': ScenarioMeta(label: 'Meeting', icon: LucideIcons.users),
  'classroom': ScenarioMeta(label: 'Classroom', icon: LucideIcons.graduation_cap),
  'home': ScenarioMeta(label: 'Home', icon: LucideIcons.house),
};

/// Category display labels
const Map<String, String> categoryLabels = {
  'all': 'All',
  'app': 'Apps',
  'device': 'Devices',
  'guide': 'Guides',
};

/// Personalized recommendation mapping by user type/category.
///
/// This intentionally filters only by category right now.
const Map<String, List<String>> personalizedToolIdsByCategory = {
  'student': [
    'envision-app',
    'u-signup-application',
    'wulira-app',
    'unad-support-programs',
    'live-transcribe',
  ],
  'professional': [
    'live-transcribe',
    'sound-amplifier',
    'wulira-app',
    'zoom-teams-live-captions',
    'otter-ai',
    'noise-reducer',
    'workplace-guide',
  ],
  'parent': [
    'hearwho-app',
    'baby-sign-language-dictionary',
    'avaz-aac-app',
    'live-transcribe',
    'hearing-test-pro',
    'caption-call',
  ],
  'senior': [
    'live-transcribe',
    'sound-amplifier',
    'hearing-test-pro',
    'caption-call',
    'alertmaster',
    'roger-pen',
    'noise-reducer',
  ],
  'caregiver': [
    'live-transcribe',
    'hearwho-app',
    'baby-sign-language-dictionary',
    'avaz-aac-app',
    'wulira-app',
    'alertmaster',
    'roger-pen',
    'hearing-loop-guide',
    'noise-reducer',
  ],
};

List<ToolItem> getPersonalizedToolsForCategory(String category) {
  final ids = personalizedToolIdsByCategory[category] ??
      personalizedToolIdsByCategory['student']!;
  final toolsById = {for (final tool in allTools) tool.id: tool};
  return ids
      .map((id) => toolsById[id])
      .whereType<ToolItem>()
      .toList(growable: false);
}
