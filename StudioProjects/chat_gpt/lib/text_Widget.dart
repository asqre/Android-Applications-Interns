import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final void Function(String?)? onSaved;
  const CustomTextField({Key? key,required this.onSaved}) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: widget.onSaved,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        suffixIcon: Icon(Icons.send,size: 15,),
      ),
    );
  }
}
