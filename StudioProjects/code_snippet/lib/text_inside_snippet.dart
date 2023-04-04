import 'package:google_fonts/google_fonts.dart';
import 'main.dart';
import 'snippet_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextInsideSnippet extends StatelessWidget {
  const TextInsideSnippet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30,25,0,25),
      child: TextFormField(
        cursorColor: Colors.black,
        cursorWidth: 1,
        maxLines: null,
        style: GoogleFonts.jetBrainsMono(
          fontWeight: FontWeight.w300,
          fontSize: 13,
          letterSpacing: 1
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
      ),
    );
  }
}
