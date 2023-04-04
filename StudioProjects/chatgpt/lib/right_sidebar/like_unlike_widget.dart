import 'package:flutter/material.dart';

class IconButtonWidget extends StatefulWidget {
  const IconButtonWidget({Key? key}) : super(key: key);

  @override
  State<IconButtonWidget> createState() => _IconButtonWidgetState();
}

class _IconButtonWidgetState extends State<IconButtonWidget> {
  bool isTapOnLike = false;
  bool isTapOnDisLike = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:80,
      height: 50,
      child: Row(
        children:   [
          IconButton(
            splashRadius: 20,
              onPressed: (){
                setState(() {
                  isTapOnLike = true;
                  isTapOnDisLike = false;
                });
              },
              icon: isTapOnLike ? const Icon(Icons.thumb_up_alt_sharp,size: 20,) :const Icon(Icons.thumb_up_off_alt_outlined,size: 20,),
          ),
          IconButton(
            splashRadius: 20,
              onPressed: (){
                setState(() {
                  isTapOnLike=false;
                  isTapOnDisLike=true;
                });
              },
              icon: isTapOnDisLike ? const Icon(Icons.thumb_down_alt_sharp, size: 20) : const Icon(Icons.thumb_down_off_alt_sharp,size: 20,),
          ),
        ],
      ),);
  }
}
