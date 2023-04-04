import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final Function(String?)? onFieldSubmitted;
  const InputField({Key? key,required this.onFieldSubmitted}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius:3,
          ),
        ]
      ),
      child: TextFormField(
        onFieldSubmitted: onFieldSubmitted,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
        cursorColor: Colors.black,
        decoration:   const InputDecoration(
          filled: true,
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black12,),
            borderRadius: BorderRadius.all(Radius.circular(5))
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black12),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          hoverColor: Colors.white  ,
          suffixIcon: Icon(Icons.send,size: 15,color: Colors.grey,),
        ),
      ),
    );
  }
}
