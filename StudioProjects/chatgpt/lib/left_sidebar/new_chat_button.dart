import 'package:flutter/material.dart';


class NewChatButton extends StatefulWidget {
  const NewChatButton({Key? key}) : super(key: key);

  @override
  State<NewChatButton> createState() => _NewChatButtonState();
}

class _NewChatButtonState extends State<NewChatButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: OutlinedButton(
        onPressed: () {
          debugPrint('Reloading to open new chat');
        },
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          side: const BorderSide(width: 0.3, color: Colors.white),
        ),
        child: Row(
          children: const [
            Icon(
              Icons.add,
              size: 17,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              'New chat',
            ),
          ],
        ),
      ),
    );
  }
}
