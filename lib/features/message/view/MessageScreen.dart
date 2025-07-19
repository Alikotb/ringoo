import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ringoo/features/message/view/ProfileDialog.dart';

import '../../../generated/assets.dart';
import '../../component/SearchBar.dart';
import '../../route/app_route.dart';
import '../FriendModel.dart';
import 'FriendCard.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  String searchText = '';

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(Icons.add, color: Colors.white),
      ),
      appBar: CustomSearchAppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: "Hamada Screen",
        onSearchChanged: (text) {
          setState(() => searchText = text);
        },
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => const ProfileDialog(),
                );
              },
              child: ClipOval(
                child: Container(
                  color: Theme.of(context).colorScheme.primary,
                  height: 36,
                  width: 36,
                  child: Image.asset(Assets.imgLogo),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
          child: Column(
            children:
                friends
                    .map(
                      (obj) => GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoute.chat);
                        },
                        child: FriendCard(obj: obj),
                      ),
                    )
                    .toList(),
          ),
        ),
      ),
    );
  }
}
