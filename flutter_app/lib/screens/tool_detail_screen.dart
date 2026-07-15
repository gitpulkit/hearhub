import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:url_launcher/url_launcher.dart';
import '../l10n/app_localizations.dart';
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
      tutorialYoutubeUrl:
          'https://www.youtube.com/watch?v=6Fknku1knmc&t=2s',
      androidStoreUrl:
          'https://play.google.com/store/apps/details?id=com.google.android.accessibility.soundamplifier',
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
      androidStoreUrl:
          'https://play.google.com/store/apps/details?id=mobile.eaudiologia.pro',
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
      // No single official app — open store search results.
      androidStoreUrl:
          'https://play.google.com/store/search?q=noise%20reducer%20hearing&c=apps',
      iosStoreUrl:
          'https://apps.apple.com/us/search?term=noise%20reducer%20hearing',
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
      tutorialYoutubeUrl: 'https://www.youtube.com/watch?v=EzDrN1JA5iA',
      androidStoreUrl:
          'https://play.google.com/store/apps/details?id=com.google.audio.hearing.visualization.accessibility.scribe',
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
      tutorialYoutubeUrl: 'https://www.youtube.com/watch?v=SyqipCxv0EY',
      androidStoreUrl:
          'https://play.google.com/store/apps/details?id=com.aisense.otter',
      iosStoreUrl:
          'https://apps.apple.com/us/app/otter-transcribe-voice-notes/id1276437113',
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
      androidStoreUrl:
          'https://play.google.com/store/apps/details?id=com.machinegenius.olelo',
      iosStoreUrl: 'https://apps.apple.com/us/app/captioncall/id1529823668',
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
      tutorialYoutubeUrl: 'https://www.youtube.com/watch?v=KOJU02GfHIU',
      externalUrl: 'https://www.phonak.com/en-us/hearing-devices/microphones/roger-pen',
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
      externalUrl: 'https://www.harriscomms.com/alertmaster.html',
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
      externalUrl: 'https://www.hearingloss.org/hearing-help/technology/hat/hearing-loop-systems/',
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
      externalUrl:
          'https://www.eeoc.gov/laws/guidance/deafness-and-hearing-impairments-workplace-and-ada',
    ),
    'wulira-app': _ToolDetail(
      name: 'Wulira App',
      tagline:
          'Mobile audiometry for early hearing-loss screening and awareness.',
      icon: LucideIcons.ear,
      helpsWith: [
        'Run quick hearing screening from a mobile device.',
        'Support early awareness in schools and community settings.',
      ],
      steps: [
        'Download Wulira from your app store.',
        'Follow the in-app prompts to complete a screening session.',
        'Review the summary and follow up with a professional if needed.',
      ],
      contexts: ['Classrooms', 'Meetings', 'At Home'],
      imageAsset: 'assets/images/hearing_test_pro.png',
      tutorialYoutubeUrl: 'https://www.youtube.com/watch?v=AKkJlfOPeAw',
      androidStoreUrl:
          'https://play.google.com/store/apps/details?id=com.josoft.jotechman.wuliraapp',
      externalUrl: 'https://wuliraapp.com/',
    ),
    'avaz-aac-app': _ToolDetail(
      name: 'AVAZ AAC App',
      tagline:
          'Picture-based communication support for children and caregivers.',
      icon: LucideIcons.message_square_text,
      helpsWith: [
        'Build picture-based messages for daily communication.',
        'Support children and caregivers with AAC routines.',
      ],
      steps: [
        'Install AVAZ AAC and set up vocabulary boards for the user.',
        'Tap symbols to create phrases; use voice output when helpful.',
        'Practice together in familiar home or classroom routines.',
      ],
      contexts: ['At Home', 'Classrooms', 'With caregivers'],
      imageAsset: 'assets/images/live_transcribe.png',
      tutorialYoutubeUrl: 'https://www.youtube.com/watch?v=XH_bqn10Xkk',
      androidStoreUrl:
          'https://play.google.com/store/apps/details?id=com.avazapp.international.lite',
      iosStoreUrl: 'https://apps.apple.com/us/app/avaz-aac/id909574843',
    ),
    'hearwho-app': _ToolDetail(
      name: 'HearWHO App',
      tagline:
          'WHO hearing screening app to support early hearing intervention.',
      icon: LucideIcons.shield_check,
      helpsWith: [
        'Screen hearing with a quick digits-in-noise check.',
        'Track results over time and know when to seek help.',
      ],
      steps: [
        'Download hearWHO from your app store.',
        'Wear headphones and follow the on-screen number prompts.',
        'Review your score and retest regularly.',
      ],
      contexts: ['At Home', 'Classrooms', 'Community screening'],
      imageAsset: 'assets/images/hearing_test_pro.png',
      androidStoreUrl:
          'https://play.google.com/store/apps/details?id=com.hearxgroup.hearwho',
      iosStoreUrl:
          'https://apps.apple.com/us/app/hearwho-check-your-hearing/id1449966543',
    ),
    'envision-app': _ToolDetail(
      name: 'Envision App',
      tagline:
          'Uses OCR to read text aloud and describe surroundings for easier access.',
      icon: LucideIcons.scan_text,
      helpsWith: [
        'Read printed text and documents out loud.',
        'Get spoken descriptions of people and surroundings.',
      ],
      steps: [
        'Download Envision from your app store.',
        'Point your camera at text or a scene.',
        'Listen as the app reads or describes what it sees.',
      ],
      contexts: ['Classrooms', 'At Home', 'Public spaces'],
      imageAsset: 'assets/images/live_transcribe.png',
      androidStoreUrl:
          'https://play.google.com/store/apps/details?id=com.letsenvision.envisionai',
      iosStoreUrl: 'https://apps.apple.com/us/app/envision-ai/id1268632314',
    ),
  };

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
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
                  decoration: BoxDecoration(
                    color: AppColors.secondary(context),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(LucideIcons.search_x,
                      size: 32, color: AppColors.primary(context)),
                ),
                const SizedBox(height: 20),
                Text(
                  l10n.toolNotFound,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.foreground(context),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  l10n.toolNotInLibrary(toolId),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.mutedForeground(context),
                  ),
                ),
                const SizedBox(height: 32),
                TextButton.icon(
                  onPressed: () => context.popOrGo('/tools'),
                  icon: Icon(LucideIcons.arrow_left,
                      size: 16, color: AppColors.primary(context)),
                  label: Text(
                    l10n.browseAllTools,
                    style: TextStyle(color: AppColors.primary(context)),
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
                      icon: Icon(LucideIcons.chevron_left, color: AppColors.foreground(context)),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      l10n.toolDetails,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.foreground(context),
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
                        decoration: BoxDecoration(
                          color: AppColors.secondary(context),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(detail.icon, size: 32, color: AppColors.primary(context)),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        detail.name,
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.foreground(context),
                            ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        detail.tagline,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColors.mutedForeground(context),
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
                  l10n.whatThisToolHelpsWith,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.foreground(context),
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
                            color: AppColors.card(context),
                            borderRadius: BorderRadius.circular(999),
                            border: Border.all(color: AppColors.border(context)),
                          ),
                          child: Text(
                            text,
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.foreground(context),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),

                const SizedBox(height: 24),

                if (detail.tutorialYoutubeUrl != null) ...[
                  HearHubButton(
                    onPressed: () => _openYoutubeTutorial(
                      context,
                      detail.tutorialYoutubeUrl!,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          LucideIcons.circle_play,
                          size: 22,
                          color: AppColors.primaryForeground(context),
                        ),
                        SizedBox(width: 10),
                        Text(l10n.watchTutorial),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
                HearHubButton(
                  variant: detail.tutorialYoutubeUrl != null
                      ? HearHubButtonVariant.secondary
                      : HearHubButtonVariant.primary,
                  onPressed: detail.hasLaunchUrl
                      ? () => _openToolStoreOrPage(context, detail)
                      : null,
                  child: Text(l10n.startUsingTool),
                ),

                const SizedBox(height: 32),

                // How to start section
                Text(
                  l10n.howToStartIn2Minutes,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.foreground(context),
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
                            decoration: BoxDecoration(
                              color: AppColors.primary(context),
                              shape: BoxShape.circle,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              '$index',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryForeground(context),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              text,
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.foreground(context),
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
                              color: AppColors.secondary(context),
                              borderRadius: BorderRadius.circular(999),
                            ),
                            child: Text(
                              c,
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.primary(context),
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
    this.tutorialYoutubeUrl,
    this.androidStoreUrl,
    this.iosStoreUrl,
    this.externalUrl,
  });

  final String name;
  final String tagline;
  final IconData icon;
  final List<String> helpsWith;
  final List<String> steps;
  final List<String> contexts;
  final String imageAsset;

  /// Full `https://www.youtube.com/watch?v=…` or `https://youtu.be/…` link.
  /// When non-null, a **Watch tutorial** button opens it in the browser / YouTube app.
  final String? tutorialYoutubeUrl;

  /// Google Play Store listing (or search) URL.
  final String? androidStoreUrl;

  /// Apple App Store listing (or search) URL.
  final String? iosStoreUrl;

  /// Fallback product / guide page when there is no mobile store listing.
  final String? externalUrl;

  bool get hasLaunchUrl =>
      androidStoreUrl != null || iosStoreUrl != null || externalUrl != null;

  /// Picks App Store on iOS, Play Store on Android/other, then any fallback.
  String? get preferredLaunchUrl {
    final preferIos = defaultTargetPlatform == TargetPlatform.iOS;
    if (preferIos) {
      return iosStoreUrl ?? androidStoreUrl ?? externalUrl;
    }
    return androidStoreUrl ?? iosStoreUrl ?? externalUrl;
  }
}

Future<void> _openYoutubeTutorial(BuildContext context, String url) async {
  final l10n = AppLocalizations.of(context);
  await _launchExternalUrl(
    context,
    url,
    invalidMessage: l10n.invalidTutorialLink,
    failMessage: l10n.couldNotOpenVideo,
  );
}

Future<void> _openToolStoreOrPage(
  BuildContext context,
  _ToolDetail detail,
) async {
  final l10n = AppLocalizations.of(context);
  final url = detail.preferredLaunchUrl;
  if (url == null) {
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(l10n.noDownloadPage)),
    );
    return;
  }
  await _launchExternalUrl(
    context,
    url,
    invalidMessage: l10n.invalidStoreLink,
    failMessage: l10n.couldNotOpenStore,
  );
}

Future<void> _launchExternalUrl(
  BuildContext context,
  String url, {
  required String invalidMessage,
  required String failMessage,
}) async {
  final uri = Uri.tryParse(url.trim());
  if (uri == null ||
      (uri.scheme != 'https' && uri.scheme != 'http') ||
      !uri.hasAuthority) {
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(invalidMessage)),
    );
    return;
  }
  final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
  if (!context.mounted) return;
  if (!ok) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(failMessage)),
    );
  }
}

