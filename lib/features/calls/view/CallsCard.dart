import 'package:flutter/material.dart';
import 'package:ringoo/features/calls/CallsModel.dart';
import 'package:ringoo/features/component/text.dart';

class CallsCard extends StatefulWidget {
  final CallsModel obj;

  const CallsCard({super.key, required this.obj});

  @override
  State<CallsCard> createState() => _CallsCardState();
}

class _CallsCardState extends State<CallsCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipOval(
            child: Container(
              height: 56,
              width: 56,
              color: Theme.of(context).colorScheme.primary,
              child: Image.asset(widget.obj.image, fit: BoxFit.fill),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: widget.obj.name,
                  color: Theme.of(context).colorScheme.scrim,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      widget.obj.type
                          ? Icons.phone_callback_outlined
                          : Icons.phone_forwarded_rounded,
                      color: widget.obj.type ? Colors.green : Colors.red,
                    ),
                    SizedBox(width: 4),
                    Text(
                      widget.obj.date,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.phone_in_talk_outlined,
              color: Theme.of(context).colorScheme.scrim,
            ),
          ),
        ],
      ),
    );
  }
}
