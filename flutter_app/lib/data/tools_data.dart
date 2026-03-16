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
