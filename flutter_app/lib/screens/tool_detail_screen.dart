import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import '../theme/app_colors.dart';
import '../utils/navigation.dart';
import '../widgets/mobile_layout.dart';
import '../widgets/hearhub_button.dart';

class ToolDetailScreen extends StatelessWidget {
  const ToolDetailScreen({super.key, required this.toolId});

  final String toolId;

  static const _tools = <String, _ToolDetail>{
    'sound-amplifier': _ToolDetail(
      name: 'Sound Amplifier',
      tagline: 'Turn quiet sounds into clear audio around you.',
      icon: LucideIcons.volume_2,
      helpsWith: [
        'Follow conversations in noisy cafes or restaurants.',
        'Hear the TV, announcements, or alarms more clearly.',
      ],
      steps: [
        'Open the Sound Amplifier app on your phone.',
        'Connect your headphones and point your phone towards the sound source.',
        'Adjust the volume and noise reduction until voices feel clear.',
      ],
      contexts: ['Cafés & Restaurants', 'At Home', 'Public spaces'],
      imageAsset: 'assets/images/sound_amplifier.png',
    ),
    'hearing-test-pro': _ToolDetail(
      name: 'Hearing Test Pro',
      tagline: 'Check your hearing in a few minutes.',
      icon: LucideIcons.ear,
      helpsWith: [
        'Understand which sounds are harder for you to hear.',
        'Track changes in your hearing over time.',
      ],
      steps: [
        'Find a quiet room and plug in your headphones.',
        'Follow the on‑screen prompts and tap when you hear a sound.',
        'Review your results and save them for your next check‑up.',
      ],
      contexts: ['Doctor visits', 'At home', 'Before appointments'],
      imageAsset: 'assets/images/hearing_test_pro.png',
    ),
    'noise-reducer': _ToolDetail(
      name: 'Noise Reducer',
      tagline: 'Reduce background noise so voices stand out.',
      icon: LucideIcons.headphones,
      helpsWith: [
        'Cut down air‑conditioner or traffic noise.',
        'Focus on the person talking during calls or meetings.',
      ],
      steps: [
        'Open the Noise Reducer app and put on your headphones.',
        'Choose the scene that matches where you are (office, street, home).',
        'Fine‑tune the sliders until voices feel comfortable.',
      ],
      contexts: ['Work meetings', 'Commuting', 'Open offices'],
      imageAsset: 'assets/images/noise_reducer.png',
    ),
    'live-transcribe': _ToolDetail(
      name: 'Live Transcribe',
      tagline: 'Real-time speech‑to‑text for lectures and meetings.',
      icon: LucideIcons.mic,
      helpsWith: [
        'Follow along in lectures, meetings, or group discussions.',
        'Get an instant written record of any spoken conversation.',
      ],
      steps: [
        'Download Live Transcribe from the Google Play Store.',
        'Open the app and grant microphone permission.',
        'Point your phone at the speaker — transcription starts automatically.',
      ],
      contexts: ['Classrooms', 'Meetings', 'Conferences'],
      imageAsset: 'assets/images/live_transcribe.png',
    ),
    'otter-ai': _ToolDetail(
      name: 'Otter.ai',
      tagline: 'AI‑powered note‑taking from spoken words.',
      icon: LucideIcons.file_text,
      helpsWith: [
        'Automatically generate notes from lectures and calls.',
        'Search and highlight key moments in any transcript.',
      ],
      steps: [
        'Sign up at otter.ai or download the mobile app.',
        'Start a new conversation and let Otter record and transcribe.',
        'Review, edit, and share your notes after the session.',
      ],
      contexts: ['Classrooms', 'Work meetings', 'Interviews'],
      imageAsset: 'assets/images/otter_ai.png',
    ),
    'caption-call': _ToolDetail(
      name: 'CaptionCall',
      tagline: 'Automatically captions every phone call.',
      icon: LucideIcons.phone,
      helpsWith: [
        'Read what the other person is saying during any phone call.',
        'Never miss important words or instructions over the phone.',
      ],
      steps: [
        'Download CaptionCall or request a captioned phone.',
        'Make or receive a call as normal.',
        'Read the captions that appear on screen in real time.',
      ],
      contexts: ['At Home', 'Doctor calls', 'Customer service'],
      imageAsset: 'assets/images/caption_call.png',
    ),
    'roger-pen': _ToolDetail(
      name: 'Roger Pen',
      tagline: 'Directional mic that streams directly to hearing aids.',
      icon: LucideIcons.mic_vocal,
      helpsWith: [
        'Hear a single speaker clearly in noisy environments.',
        'Stream speech wirelessly to compatible hearing aids or cochlear implants.',
      ],
      steps: [
        'Pair the Roger Pen with your hearing aid or receiver.',
        'Place the pen near the speaker or pass it around a table.',
        'Speech is streamed directly into your hearing device.',
      ],
      contexts: ['Restaurants', 'Meetings', 'Classrooms'],
      imageAsset: 'assets/images/roger_pen.png',
    ),
    'alertmaster': _ToolDetail(
      name: 'AlertMaster',
      tagline: 'Visual and vibrating alerts for home sounds.',
      icon: LucideIcons.bell,
      helpsWith: [
        'Know when the doorbell, phone, or smoke alarm goes off.',
        'Get visual or bed‑shaker alerts while you sleep.',
      ],
      steps: [
        'Install AlertMaster receivers in the rooms you use most.',
        'Pair each receiver with the sounds you want to monitor.',
        'Receive a flash or vibration whenever those sounds occur.',
      ],
      contexts: ['At Home', 'Bedroom', 'Living room'],
      imageAsset: 'assets/images/alertmaster.png',
    ),
    'hearing-loop-guide': _ToolDetail(
      name: 'Hearing Loop Guide',
      tagline: 'How to use hearing loops in public venues.',
      icon: LucideIcons.info,
      helpsWith: [
        'Pick up clearer audio directly in your hearing aid.',
        'Identify venues that support hearing loop technology.',
      ],
      steps: [
        'Look for the hearing loop symbol at the venue entrance.',
        'Switch your hearing aid to the "T" (telecoil) setting.',
        'You will receive audio directly without background noise.',
      ],
      contexts: ['Restaurants', 'Cinemas', 'Classrooms', 'Places of worship'],
      imageAsset: 'assets/images/hearing_loop_guide.png',
    ),
    'workplace-guide': _ToolDetail(
      name: 'Workplace Accommodations',
      tagline: 'Know your rights and get the right support at work.',
      icon: LucideIcons.briefcase,
      helpsWith: [
        'Request the hearing accommodations you are entitled to.',
        'Set up captioning, remote CART, or assistive devices at work.',
      ],
      steps: [
        'Speak to your HR department or disability coordinator.',
        'Document your hearing needs and preferred accommodations.',
        'Follow up to ensure the agreed tools are in place.',
      ],
      contexts: ['Open offices', 'Remote work', 'Team meetings'],
      imageAsset: 'assets/images/workplace_guide.png',
    ),
  };

  @override
  Widget build(BuildContext context) {
    final detail = _tools[toolId];

    // Unknown toolId — show a graceful not-found state
    if (detail == null) {
      return MobileLayout(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                const Text(
                  'Tool not found',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.foreground,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '"$toolId" is not in our library yet.',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.mutedForeground,
                  ),
                ),
                const SizedBox(height: 32),
                TextButton.icon(
                  onPressed: () => context.popOrGo('/tools'),
                  icon: const Icon(LucideIcons.arrow_left,
                      size: 16, color: AppColors.primary),
                  label: const Text(
                    'Browse all tools',
                    style: TextStyle(color: AppColors.primary),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return MobileLayout(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header row
                Row(
                  children: [
                    IconButton(
                      onPressed: () => context.popOrGo('/tools'),
                      icon: const Icon(LucideIcons.chevron_left, color: AppColors.foreground),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Tool Details',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.foreground,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Icon + title
                Center(
                  child: Column(
                    children: [
                      Container(
                        width: 64,
                        height: 64,
                        decoration: const BoxDecoration(
                          color: AppColors.secondary,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(detail.icon, size: 32, color: AppColors.primary),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        detail.name,
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.foreground,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        detail.tagline,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColors.mutedForeground,
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Hero image
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.asset(
                      detail.imageAsset,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                // What this tool helps with
                Text(
                  'What this tool helps with',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.foreground,
                      ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: detail.helpsWith
                      .map(
                        (text) => Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: AppColors.card,
                            borderRadius: BorderRadius.circular(999),
                            border: Border.all(color: AppColors.border),
                          ),
                          child: Text(
                            text,
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.foreground,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),

                const SizedBox(height: 24),

                // Primary CTA
                HearHubButton(
                  onPressed: () {},
                  child: const Text('Start using tool'),
                ),

                const SizedBox(height: 32),

                // How to start section
                Text(
                  'How to start in 2 minutes',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.foreground,
                      ),
                ),
                const SizedBox(height: 16),
                ...detail.steps.asMap().entries.map(
                  (entry) {
                    final index = entry.key + 1;
                    final text = entry.value;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 28,
                            height: 28,
                            decoration: const BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              '$index',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryForeground,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              text,
                              style: const TextStyle(
                                fontSize: 14,
                                color: AppColors.foreground,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),

                const SizedBox(height: 16),

                // Context chips
                if (detail.contexts.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: detail.contexts
                        .map(
                          (c) => Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: AppColors.secondary,
                              borderRadius: BorderRadius.circular(999),
                            ),
                            child: Text(
                              c,
                              style: const TextStyle(
                                fontSize: 12,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],

                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ToolDetail {
  const _ToolDetail({
    required this.name,
    required this.tagline,
    required this.icon,
    required this.helpsWith,
    required this.steps,
    required this.contexts,
    required this.imageAsset,
  });

  final String name;
  final String tagline;
  final IconData icon;
  final List<String> helpsWith;
  final List<String> steps;
  final List<String> contexts;
  final String imageAsset;
}

