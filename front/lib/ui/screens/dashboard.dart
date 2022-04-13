// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:front/ui/screens/board_content.dart';
import 'package:front/ui/screens/side_menu.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  //int _counter = 0;

  @override
  void initState() {
    super.initState();
    //fetch();
  }

  // void _incrementCounter() {
  //   setState(() {
  //     //_counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Expanded(
              child: SideMenu(),
            ),
            Expanded(
              flex: 5,
              child: BoardContent(),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
