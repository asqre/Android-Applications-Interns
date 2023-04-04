import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  final Icon icon;
  final String buttonName;
  const ButtonWidget({Key? key,required this.icon,required this.buttonName}) : super(key: key);
  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  bool _isHover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (pointer){
        setState(() { //  on setState it will rebuild the Build widget only
          _isHover=true;
        });
      },
      onExit: (pointer){
        setState(() {
          _isHover=false;
        });
      },
      child: SizedBox(
        height: 50,
        child: ElevatedButton(
          onPressed: (){},
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: (_isHover ? Colors.blueGrey[900]: Colors.black),
          ),
          child: Row(
            children: [
              widget.icon,
              const SizedBox(width: 20,),
              Text(widget.buttonName),
            ],
          ),
        ),
      ),
    );
  }
}



class UpgradeCard extends StatelessWidget {
  const UpgradeCard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: 50,
      height: 30,
      child: Card(
        color: Colors.yellow[200],
        child: const Center(child: Text('NEW',style: TextStyle(color: Colors.black,fontWeight:FontWeight.bold,),)),
      ),
    );
  }
}