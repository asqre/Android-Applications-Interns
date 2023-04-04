import 'package:flutter/material.dart';

class EditorParams{
  final int tabSpaces;
  const EditorParams({
    this.tabSpaces=2,
});
}

class StackDemo extends StatelessWidget {
  const StackDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              color: Colors.red,
              height: MediaQuery.of(context).size.height* 0.5,
            ),
            Container(
              color: Colors.black,
              height: MediaQuery.of(context).size.height*0.7,

            ),
            Container(
              color: Colors.blue,
              height: MediaQuery.of(context).size.height*0.2,

            )
          ],
        ),
      ),
    );
  }
}
