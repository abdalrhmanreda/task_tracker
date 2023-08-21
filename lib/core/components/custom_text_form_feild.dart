import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../style/style.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    this.formFieldKey,
    required this.isPassword,
    this.type,
    this.controller,
    this.validate,
    this.onTap,
    this.suffixIcon,
    this.suffixPressed,
    this.border,
    this.edgeInsetsGeometry,
    this.hint,
    this.onChanged,
    this.onSubmitted,
    this.prefixIcon,
    this.labelStyle,
    this.hintStyle,
    this.enabledBorder,
    this.focusedBorder,
    this.maxLine,
    this.minLine,
    this.isEnable,
    this.scrollController,
    this.autofocus,
    this.focusNode,
    this.floatingLabelBehavior,
    this.hintTextDirection,
    this.hintMaxLines,
    this.onSaved,
    this.label,
  });

  ScrollController? scrollController;
  bool isPassword;
  bool? autofocus;
  TextInputType? type;
  TextEditingController? controller;
  String? Function(String?)? onSubmitted;
  String? Function(String?)? onSaved;
  String? Function(String?)? onChanged;
  String? Function(String?)? validate;
  String? hint;
  IconData? prefixIcon;
  IconData? suffixIcon;
  VoidCallback? onTap;
  VoidCallback? suffixPressed;
  InputBorder? border;
  InputBorder? focusedBorder;
  InputBorder? enabledBorder;
  EdgeInsetsGeometry? edgeInsetsGeometry;
  String? label;
  TextStyle? hintStyle;
  TextStyle? labelStyle;
  bool? isEnable;
  int? maxLine;
  int? minLine;
  FocusNode? focusNode;
  FloatingLabelBehavior? floatingLabelBehavior;
  TextDirection? hintTextDirection;
  int? hintMaxLines;
  Key? formFieldKey;
  Widget build(BuildContext context) {
    return TextFormField(
      key: formFieldKey,
      scrollController: scrollController,
      obscureText: isPassword,
      keyboardType: type,
      controller: controller,
      onFieldSubmitted: onSubmitted,
      onSaved: onSaved,
      onChanged: onChanged,
      validator: validate,
      maxLines: maxLine,
      minLines: minLine,
      onTap: onTap,
      enabled: isEnable,
      focusNode: focusNode,
      decoration: InputDecoration(
        hintTextDirection: hintTextDirection,
        hintMaxLines: hintMaxLines,
        helperStyle: const TextStyle(
          decorationStyle: TextDecorationStyle.dotted,
        ),
        contentPadding: edgeInsetsGeometry,
        prefixIcon: Icon(
          prefixIcon,
          size: 20,
          color: Theme.of(context).iconTheme.color,
        ),
        border: border,
        focusedBorder: focusedBorder,
        enabledBorder: enabledBorder,
        hintStyle: GoogleFonts.aBeeZee(color: Colors.grey),
        hintText: hint,
        labelText: label ?? '',
        suffixIcon: suffixIcon != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffixIcon,
                  color: Theme.of(context).iconTheme.color,
                ))
            : null,
        labelStyle: Theme.of(context).textTheme.titleMedium,
      ),
      cursorColor: const Color(Style.kPrimaryColor),
    );
  }
}
