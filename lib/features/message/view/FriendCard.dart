
import 'package:flutter/material.dart';
import 'package:ringoo/features/component/text.dart';
import '../FriendModel.dart';

class FriendCard extends StatefulWidget {
  final FriendChatModel obj;
   FriendCard({super.key, required this.obj});

  @override
  State<FriendCard> createState() => _FriendCardState();
}

class _FriendCardState extends State<FriendCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Avatar
            ClipOval(
              child: Container(
                height: 56,
                width: 56,
                color: Colors.deepOrange,
                child: Image.asset(
                  widget.obj.image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: widget.obj.name,
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.obj.message,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomText(
                  text: widget.obj.date,
                  color: Colors.black38,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
                const SizedBox(height: 8),

                Visibility(
                  visible: widget.obj.numUnreadedMsg > 0,
                  child: ClipOval(
                    child: Container(
                      height: 30,
                      width: 30,
                      color: Colors.deepOrange,
                      child: Center(
                        child: CustomText(
                          text: "${widget.obj.numUnreadedMsg }",
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

