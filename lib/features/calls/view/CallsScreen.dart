import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../component/SearchBar.dart';
import '../CallsModel.dart';
import 'CallsCard.dart';

class CallsScreen extends StatefulWidget {
  const CallsScreen({super.key});

  @override
  State<CallsScreen> createState() => _CallsScreenState();
}

class _CallsScreenState extends State<CallsScreen> {
  String searchText = "";
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
        appBar: CustomSearchAppBar(
          title: "Hamada Screen",
          onSearchChanged: (text) {
            setState(() => searchText = text);
          },
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.only(left:16,right: 16,top: 8),
                child: Column(
                  children: calls.map((obj) => CallsCard(obj: obj)).toList(),
                )
            )
        )
    );
  }
}
