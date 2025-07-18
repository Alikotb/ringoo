
import 'package:flutter/material.dart';
import 'package:ringoo/features/component/text.dart';
import '../../message/FriendModel.dart';

class GroupCard extends StatefulWidget {
  final FriendChatModel obj;
   GroupCard({super.key, required this.obj});

  @override
  State<GroupCard> createState() => _GroupCardState();
}

class _GroupCardState extends State<GroupCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(
              child: Container(
                height: 56,
                width: 56,
                color: Colors.deepOrange,
                child: widget.obj.image.isNotEmpty
                    ? Image.asset(
                  widget.obj.image,
                  fit: BoxFit.fill,
                )
                    : Icon(
                  Icons.groups,
                  size: 30,
                  color: Colors.white,
                ),

              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child:Text(
                          widget.obj.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        )

                      ),
                      const SizedBox(width: 8),
                      CustomText(
                        text: widget.obj.date,
                        color: Colors.black38,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ],
                  ),

                  const SizedBox(height: 4),
                  Text(
                    widget.obj.message,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
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

