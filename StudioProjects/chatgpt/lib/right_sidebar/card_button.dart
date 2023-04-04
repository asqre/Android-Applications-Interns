import 'package:flutter/material.dart';

class CardButton extends StatefulWidget {
  final String givenText;
  final Icon? trailing;
  const CardButton({Key? key,required this.givenText, this.trailing}) : super(key: key);

  @override
  State<CardButton> createState() => _CardButtonState();
}

class _CardButtonState extends State<CardButton> {
  var isHover=false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (pointer){
        setState(() {
          isHover=true;
        });
      },
      onExit: (pointer){
        setState(() {
          isHover=false;
        });
      },
      child: SizedBox(
        height: 70,
        width: 250,
        child: Card(
          color: isHover ? Colors.grey[400] : Colors.grey[200],
          child: Center(
            child: ListTile(
              title: Text(widget.givenText,style: const TextStyle(fontSize: 13),textAlign: TextAlign.center,),
              trailing: widget.trailing,
            ),
          ),

        ),
      ),
    );
  }
}
