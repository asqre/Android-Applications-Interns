import 'dart:ffi';

import 'package:chatgpt/right_sidebar/display_message.dart';
import 'package:chatgpt/right_sidebar/grid_view.dart';
import 'package:chatgpt/right_sidebar/input_field.dart';
import 'package:chatgpt/right_sidebar/classes.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RightSideBar extends StatefulWidget {
  const RightSideBar({Key? key}) : super(key: key);

  @override
  State<RightSideBar> createState() => _RightSideBarState();
}

class _RightSideBarState extends State<RightSideBar> {
  bool isUserInput = false;
  final _key = GlobalKey<FormState>();

  List<Messages> messages = [];

  final int ind = 1;
  final String chatNo='ChatNo';
   Map<Chats, Messages> m={ };


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        messages.isNotEmpty
            ? DisplayMessage(messages: messages)
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height + 100,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 200, top: 100, right: 200, bottom: 100),
                    child: Column(
                      children: const [
                        Text(
                          'ChatGPT',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 40,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'Roboto',
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 50),
                          child: GridViewWidget(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
        Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 125, right: 125, bottom: 25),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 200,
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black,
                                backgroundColor: Colors.white,
                              ),
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.restart_alt,
                                    size: 20,
                                    color: Colors.black54,
                                  ),
                                  Text('Regenerate response')
                                ],
                              ),
                            ),
                          ),
                        ),
                        Form(
                          key: _key,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 50, right: 50),
                            child: InputField(
                              onFieldSubmitted: (value) {
                                messages.add(Messages(message: value!, isUserInput: true));
                                messages.add(Messages(message: value, isUserInput: false));
                                _key.currentState?.reset();
                                setState(() {});
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () => launchUrl(Uri.parse(
                                  'https://help.openai.com/en/articles/6825453-chatgpt-release-notes')),
                              child: Text(
                                'ChatGPT Mar 14 Version.',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.grey[900],
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Text(
                              '  Free Research Preview. Our goal is to make AI systems more natural and safe to interact with. Your feedback will help us improve.',
                              style: TextStyle(
                                color: Colors.grey[900],
                                fontSize: 12,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
      ],
    );
  }
}
