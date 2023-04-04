import 'package:flutter/material.dart';

class FilledCard extends StatelessWidget {
  final String userInput;
  final Icon? trailing;
  const FilledCard({Key? key, required this.userInput, this.trailing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          (userInput.length > 50)
              ? Card(
                  elevation: 0, //for shadow
                  color: Colors.grey[200],
                  child: SizedBox(
                    width: 300,
                    height: 70,
                    child: Center(
                      child: ListTile(
                        title: Text(
                          userInput,
                          style: const TextStyle(
                            fontSize: 13,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        trailing: trailing,
                      ),
                    ),
                  ),
                )
              : Card(
                  elevation: 0, //for shadow
                  color: Colors.grey[200],
                  child: SizedBox(
                    width: 300,
                    height: 50,
                    child: Center(
                      child: ListTile(
                        title: Text(
                          userInput,
                          style: const TextStyle(
                            fontSize: 13,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        trailing: trailing,
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
