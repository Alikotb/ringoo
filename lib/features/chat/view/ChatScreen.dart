import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import '../../../generated/assets.dart';
import '../../../utils/enums/ChatEnum.dart';
import 'ChatBubbleWidget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool isTyping = false;
  final TextEditingController _controller = TextEditingController();
  bool showEmojiPicker = false;
  final FocusNode _focusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();

  final List<ChatMessage> messages = [
    ChatMessage(
      sender: "Jhon",
      content: "Have a great working week!!",
      type: MessageType.text,
      isMe: false,
    ),
    ChatMessage(
      sender: "Jhon",
      content: "Hope you like it",
      type: MessageType.text,
      isMe: false,
    ),
    ChatMessage(
      sender: "Jhon",
      content: "audio_url",
      type: MessageType.audio,
      isMe: false,
    ),
    ChatMessage(
      sender: "Jhon",
      content:
          "https://scontent.faly2-2.fna.fbcdn.net/v/t39.30808-6/518403186_1130048385976724_8942267520975510507_n.jpg?stp=dst-jpg_s640x640_tt6&_nc_cat=1&ccb=1-7&_nc_sid=127cfc&_nc_ohc=00ax8tn3iyoQ7kNvwHidPRX&_nc_oc=AdlgD8y_WwYM9l-FcIB-t3eBBfCvlDw8QEgWLM4ElSe4MxuNW4VhhPpbsCX8hEZrU78&_nc_zt=23&_nc_ht=scontent.faly2-2.fna&_nc_gid=4CYxOU9UbPVBhtgrlDOoww&oh=00_AfStA3Zmu-9z8BmokenWgWbPUQA62mRRDlj4aQbdpvYWkQ&oe=68815237",
      type: MessageType.image,
      isMe: false,
    ),
    ChatMessage(
      sender: "Me",
      content: "Hello! Jhon Abraham",
      type: MessageType.text,
      isMe: true,
    ),
  ];

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        setState(() {
          showEmojiPicker = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onSurface,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Theme.of(context).colorScheme.scrim,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            CircleAvatar(backgroundImage: AssetImage(Assets.imgAli)),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                "Jhon Abraham",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.scrim,
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.call, color: Theme.of(context).colorScheme.scrim),
            onPressed: () {},
          ),
          SizedBox(width: 4),
          IconButton(
            icon: Icon(
              Icons.video_call,
              color: Theme.of(context).colorScheme.scrim,
            ),
            onPressed: () {},
          ),
          SizedBox(width: 4),
        ],
      ),
      body: Container(
        color: Theme.of(context).colorScheme.onSurface,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.all(8),
                  itemCount: messages.length,
                  itemBuilder:
                      (context, index) => ChatBubble(message: messages[index]),
                ),
              ),
              _buildInputArea(),
              _buildEmojiPicker(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputArea() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              FocusScope.of(context).unfocus();
              setState(() {
                showEmojiPicker = !showEmojiPicker;
              });
            },
            icon: Icon(
              Icons.emoji_emotions_outlined,
              color: Theme.of(context).colorScheme.scrim,
            ),
          ),

          Expanded(
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              maxLines: null,
              minLines: 1,
              keyboardType: TextInputType.multiline,
              onChanged: (value) {
                setState(() {
                  isTyping = value.trim().isNotEmpty;
                });
              },
              style: TextStyle(color: Theme.of(context).colorScheme.scrim),
              decoration: InputDecoration(
                hintText: "Write your message",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            ),
          ),
          SizedBox(width: 8),
          isTyping
              ? IconButton(
                icon: Icon(
                  Icons.send,
                  color: Theme.of(context).colorScheme.scrim,
                ),
                onPressed: () {
                  if (_controller.text.trim().isEmpty) return;

                  setState(() {
                    messages.add(
                      ChatMessage(
                        sender: "Me",
                        content: _controller.text.trim(),
                        type: MessageType.text,
                        isMe: true,
                      ),
                    );
                    _controller.clear();
                    isTyping = false;
                  });
                  _scrollToBottom();
                },
              )
              : Row(
                children: [
                  Icon(
                    Icons.camera_alt,
                    color: Theme.of(context).colorScheme.scrim,
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.mic, color: Theme.of(context).colorScheme.scrim),
                ],
              ),
        ],
      ),
    );
  }

  Widget _buildEmojiPicker() {
    return Offstage(
      offstage: !showEmojiPicker,
      child: SizedBox(
        height: 250,
        child: SafeArea(
          child: EmojiPicker(
            onEmojiSelected: (category, emoji) {
              _controller.text += emoji.emoji;
              _controller.selection = TextSelection.fromPosition(
                TextPosition(offset: _controller.text.length),
              );
              setState(() {
                isTyping = _controller.text.isNotEmpty;
              });
            },
            config: const Config(
              emojiViewConfig: EmojiViewConfig(
                emojiSizeMax: 32,
                gridPadding: EdgeInsets.zero,
              ),
              skinToneConfig: SkinToneConfig(),
              categoryViewConfig: CategoryViewConfig(),
              bottomActionBarConfig: BottomActionBarConfig(),
              searchViewConfig: SearchViewConfig(),
            ),
          ),
        ),
      ),
    );
  }
}
