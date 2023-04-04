import 'package:chatgpt/right_sidebar/like_unlike_widget.dart';
import 'package:flutter/material.dart';
import 'classes.dart';

class DisplayMessage extends StatelessWidget {
  final List<Messages> messages;
  const DisplayMessage({Key? key,required this.messages,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            itemCount: messages.length,
            itemBuilder: (BuildContext context, int ind){
              return  Padding(
                padding: const EdgeInsets.only(left: 150,right: 165,top: 20,bottom: 20),
                child: !messages[ind].isUserInput ? const ListTile(
                    leading: Icon(Icons.question_answer),
                    title:  Text('Here is your corresponding answer'),
                    trailing: IconButtonWidget(),
                ): ListTile(
                    leading: const Icon(Icons.person),
                    title:  Text(messages[ind].message),
                    trailing: const Icon(Icons.edit_note_rounded,size: 20,),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int ind){
              return const Divider();
            },
          ),
        ),
    ],
    );
  }
}
