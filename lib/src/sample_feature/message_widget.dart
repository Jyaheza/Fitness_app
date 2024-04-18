import 'package:final_project/src/sample_feature/message.dart';
import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({super.key, required this.message});

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          message.fromUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 520),
            decoration: BoxDecoration(
              color: message.fromUser
                  ? Theme.of(context).colorScheme.primaryContainer
                  : Theme.of(context).colorScheme.surfaceVariant,
              borderRadius: BorderRadius.circular(18),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 20,
            ),
            margin: const EdgeInsets.only(bottom: 8),
            child: Text(message.text),
          ),
        ),
      ],
    );
  }
}
