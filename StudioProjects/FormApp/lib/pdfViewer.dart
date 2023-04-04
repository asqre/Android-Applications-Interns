
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
class MyHomePage7 extends StatefulWidget {
  const MyHomePage7({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage7> createState() => _MyHomePage7State();
}

class _MyHomePage7State extends State<MyHomePage7> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title:  Text(
              widget.title,
            ),
          ),
          body: const Text("hello"),
        ),
    );
  }
}
