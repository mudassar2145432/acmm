// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Authfields extends StatelessWidget {
  final String label;
  final bool obscuretext;
  final ValueChanged<String>? onChanged;

  Authfields({
    required this.label,
    required this.obscuretext,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      child: TextField(
        obscureText: obscuretext,
        cursorColor: Colors.grey,
        onChanged: onChanged,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          label: Text(
            label,
            style: GoogleFonts.aBeeZee(
              color: const Color.fromARGB(255, 155, 155, 155),
              fontWeight: FontWeight.w500,
              fontSize: 15,
              fontStyle: FontStyle.italic, // Add italic font style
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 194, 194, 194)),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 224, 223, 223)),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          contentPadding: EdgeInsets.all(7),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 224, 223, 223)),
          ),
        ),
        style: TextStyle(
          color: Color.fromARGB(255, 34, 32, 32),
        ),
      ),
    );
  }
}
