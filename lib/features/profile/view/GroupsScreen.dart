
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ringoo/features/message/FriendModel.dart';

import 'GroupCard.dart';

class GroupsScreen extends StatefulWidget {
  const GroupsScreen({super.key});

  @override
  State<GroupsScreen> createState() => _GroupsScreenState();
}

class _GroupsScreenState extends State<GroupsScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(onPressed: (){},child: Icon(Icons.add,color: Colors.white,),backgroundColor: Colors.deepOrange,),
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Hamada Screen"),
        centerTitle: true,
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.search)),
      ),
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left:16,right: 16,top: 8),
            child: Column(
              children: groups.map((obj) =>GroupCard(obj: obj)).toList(),
            ),
          )
      ),

    );
  }
}
