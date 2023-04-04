import 'package:code_snippet/text_code_editor.dart';
import 'package:code_snippet/text_inside_snippet.dart';
import 'package:flutter/material.dart';

class SnippetPage extends StatelessWidget {
  const SnippetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(300, 100, 300, 50),
        child: Container(
          color: Colors.red[50],
          child: const TextInsideSnippet(),
        ),
      ),
    );
  }
}
