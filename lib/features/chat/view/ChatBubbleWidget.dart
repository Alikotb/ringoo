import 'package:flutter/material.dart';

import '../../../utils/enums/ChatEnum.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessage message;

  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final alignment =
        message.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final bgColor =
        message.isMe
            ? Theme.of(context).colorScheme.secondary
            : Theme.of(context).colorScheme.onPrimaryContainer;

    return Align(
      alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: alignment,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: _buildMessageContent(context),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageContent(BuildContext context) {
    switch (message.type) {
      case MessageType.text:
        return Text(
          message.content,
          style: TextStyle(color: Theme.of(context).colorScheme.scrim),
        );
      case MessageType.image:
        return Image.network(message.content, width: 150);
      case MessageType.audio:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.play_arrow, color: Theme.of(context).colorScheme.scrim),
            Container(
              width: 100,
              height: 4,
              color: Theme.of(context).colorScheme.scrim,
            ),
            Text(
              "00:16",
              style: TextStyle(color: Theme.of(context).colorScheme.scrim),
            ),
          ],
        );
    }
  }
}
