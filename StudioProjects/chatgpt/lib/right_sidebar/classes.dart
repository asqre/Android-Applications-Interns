import 'package:flutter/material.dart';

class Messages{
  final bool isUserInput;
  final String message;
  Messages({
     this.isUserInput = false,
    required this.message,
});
}


class Chats{
  final String chatNo;
  final List<Messages> messages;
  Chats({
    required this.chatNo,
    required this.messages,
  });
}







// Map<String, DisplayMessage(messages)> newChat;

class EditMessageField extends StatelessWidget {
  const EditMessageField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.person),
        suffixIcon: Icon(Icons.edit_note),

      ),
    );
  }
}
