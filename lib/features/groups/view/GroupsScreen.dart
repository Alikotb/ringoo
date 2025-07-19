import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ringoo/features/message/FriendModel.dart';

import '../../component/SearchBar.dart';
import 'GroupCard.dart';

class GroupsScreen extends StatefulWidget {
  const GroupsScreen({super.key});

  @override
  State<GroupsScreen> createState() => _GroupsScreenState();
}

class _GroupsScreenState extends State<GroupsScreen> {
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
          child: Column(
            children: groups.map((obj) => GroupCard(obj: obj)).toList(),
          ),
        ),
      ),
    );
  }
}
