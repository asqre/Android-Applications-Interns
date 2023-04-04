import 'package:flutter/material.dart';

import 'map_page_1.dart';

void main() => runApp(const MyBugMap());

class MyBugMap extends StatelessWidget {
  const MyBugMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BugMap',
      home: Scaffold(body: getMap(),),
    );
  }
}

