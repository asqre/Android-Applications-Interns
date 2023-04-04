import 'package:flutter/material.dart';

import 'chat_Gpt_Page.dart';

void main() => runApp(const ChatGptClone());

class ChatGptClone extends StatelessWidget {
  const ChatGptClone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'New chat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(body: ChatGPTPage()),
    );
  }
}
