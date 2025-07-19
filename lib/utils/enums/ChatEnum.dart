
enum MessageType { text, image, audio }

class ChatMessage {
  final String sender;
  final String content;
  final MessageType type;
  final bool isMe;

  ChatMessage({
    required this.sender,
    required this.content,
    required this.type,
    required this.isMe,
  });
}
