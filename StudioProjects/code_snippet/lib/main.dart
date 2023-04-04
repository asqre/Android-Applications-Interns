import 'package:code_snippet/button_page.dart';
import 'package:flutter/material.dart';
import 'snippet_page.dart';

void main(){
  runApp(const MySnippetCode());
}

class MySnippetCode extends StatelessWidget {
  const MySnippetCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: 'Bugsmirror Snippet Code',
      home: Scaffold(body: ButtonPage()),
    );
  }
}
