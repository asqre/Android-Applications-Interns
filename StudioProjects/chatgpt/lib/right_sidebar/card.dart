import 'package:flutter/material.dart';

class FilledCard extends StatelessWidget {
  final String givenText;
  final Icon? trailing;
  const FilledCard({Key? key, required this.givenText, this.trailing}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 250,
      child: Card(
        color: Colors.grey[200],
        child: Center(
          child: ListTile(
            title: Text(givenText,style: const TextStyle(fontSize: 13),textAlign: TextAlign.center,),
            trailing: trailing,
          ),
        ),

      ),
    );
  }
}
