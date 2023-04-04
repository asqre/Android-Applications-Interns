import 'package:code_snippet/snippet_page.dart';
import 'package:code_snippet/text_code_editor.dart';
import 'package:code_snippet/text_inside_snippet.dart';
import 'package:flutter/material.dart';

class ButtonPage extends StatelessWidget {
  const ButtonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center ,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SnippetPage()),
              );
            },
            child: const Text('Normal Editor'),
          ),
          const SizedBox(height: 50,),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StackDemo()),
                );
              },
              child: const Text('Snippet Editor')),
        ],
      ),
    );
  }
}
