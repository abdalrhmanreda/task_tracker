import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  double? height;
  double? width;
  int? color;
  double? radius;
  final VoidCallback onPressed;
  final String text;
  double? fontSize;
  int? textColor;
  double? horizontal;
  double? vertical;

  CustomButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.radius,
      this.height,
      this.width,
      this.fontSize,
      this.textColor,
      this.horizontal,
      this.vertical,
      this.color});
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin:
          EdgeInsets.symmetric(vertical: vertical!, horizontal: horizontal!),
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius!),
        color: Color(color!),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: GoogleFonts.aBeeZee(
            fontSize: fontSize,
            color: Color(textColor!),
          ),
        ),
      ),
    );
  }
}
