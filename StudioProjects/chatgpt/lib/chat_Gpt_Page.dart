import 'package:chatgpt/left_sidebar/left_sidebar.dart';
import 'package:chatgpt/right_sidebar/right_sidebar.dart';
import 'package:flutter/material.dart';

class ChatGPTPage extends StatelessWidget {
  const ChatGPTPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery=MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: mediaQuery.width * 0.2,
          height: mediaQuery.height,
          child: const LeftSideBar(),
        ),
        SizedBox(
          width: mediaQuery.width * 0.8,
          height: mediaQuery.height,
          child: const RightSideBar(),
        )
      ],
    );
  }
}

