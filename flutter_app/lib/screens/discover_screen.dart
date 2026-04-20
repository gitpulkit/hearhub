import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import '../theme/app_colors.dart';
import '../widgets/mobile_layout.dart';
import '../utils/navigation.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final List<_ChatMessage> _messages = [
    const _ChatMessage(
      fromUser: false,
      text: "Hi, I'm HearHub Guide.\nWhat do you want help with today?",
    ),
  ];

  void _addUserChoice(String text) {
    setState(() {
      _messages.add(_ChatMessage(fromUser: true, text: text));
      _messages.add(_buildAssistantReply(text));
    });
  }

  _ChatMessage _buildAssistantReply(String choice) {
    if (choice == 'Understanding speech in noise') {
      return const _ChatMessage(
        fromUser: false,
        text:
            "Sounds like you need help hearing people in cafés, restaurants, or busy places.\n\nI recommend **Sound Amplifier** and **Noise Reducer**.\n\nYou can:\n• Try quick questions in Daily Situations on the Dashboard\n• Or tap Top Picks → Learn more to see how these tools work.",
      );
    }
    if (choice == 'Taking notes from speech') {
      return const _ChatMessage(
        fromUser: false,
        text:
            "You want spoken words turned into notes or captions.\n\nI recommend **Live Transcribe** and **Otter.ai**.\n\nCheck the Student guide or tap Learn more on Live Transcribe to see how to use them.",
      );
    }
    if (choice == 'Checking my hearing') {
      return const _ChatMessage(
        fromUser: false,
        text:
            "You’d like to understand your hearing better.\n\nI recommend **Hearing Test Pro**.\n\nYou can start from Top Picks on the Dashboard and open Learn more to get a simple walkthrough.",
      );
    }
    return const _ChatMessage(
      fromUser: false,
      text:
          "No problem. You can explore tools on the Dashboard, or answer a few Daily Situations questions so we can learn what’s hardest for you.",
    );
  }

  @override
  Widget build(BuildContext context) {
    return MobileLayout(
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => context.popOrGo('/dashboard'),
                    icon: const Icon(LucideIcons.chevron_left, color: AppColors.foreground),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Discover tools',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.foreground,
                        ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  final isUser = message.fromUser;
                  return Align(
                    alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                      decoration: BoxDecoration(
                        color: isUser ? AppColors.primary : AppColors.card,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Text(
                        message.text,
                        style: TextStyle(
                          color: isUser ? AppColors.primaryForeground : AppColors.foreground,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Tap an option to get a suggestion:',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.mutedForeground,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _ChoiceChipButton(
                        label: 'Understanding speech in noise',
                        onTap: () => _addUserChoice('Understanding speech in noise'),
                      ),
                      _ChoiceChipButton(
                        label: 'Taking notes from speech',
                        onTap: () => _addUserChoice('Taking notes from speech'),
                      ),
                      _ChoiceChipButton(
                        label: 'Checking my hearing',
                        onTap: () => _addUserChoice('Checking my hearing'),
                      ),
                      _ChoiceChipButton(
                        label: 'Something else',
                        onTap: () => _addUserChoice('Something else'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChoiceChipButton extends StatelessWidget {
  const _ChoiceChipButton({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(999),
          border: Border.all(color: AppColors.border),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            color: AppColors.foreground,
          ),
        ),
      ),
    );
  }
}

class _ChatMessage {
  const _ChatMessage({required this.fromUser, required this.text});

  final bool fromUser;
  final String text;
}

