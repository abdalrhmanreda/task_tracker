import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_size_box_height.dart';
import 'custom_text_form_feild.dart';

class BuildTaskItemFeild extends StatelessWidget {
  BuildTaskItemFeild({
    required this.title,
    required this.controller,
    this.hint,
    this.label,
    required this.height,
    this.minLine,
    this.maxLine,
    this.textStyle,
    this.suffixIcon,
    this.suffixPressed,
    this.onTap,
    this.prefixIcon,
    this.type,
    this.scrollController,
  });
  String title;
  String? hint;
  String? label;
  VoidCallback? suffixPressed;
  VoidCallback? onTap;
  TextEditingController controller;
  TextStyle? textStyle;
  double? height;
  IconData? suffixIcon;
  IconData? prefixIcon;
  int? maxLine;
  int? minLine;
  TextInputType? type;
  ScrollController? scrollController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 15.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textStyle,
          ),
          CustomSizedBoxHeight(
            height: height,
          ),
          CustomTextFormField(
            controller: controller,
            scrollController: scrollController,
            prefixIcon: prefixIcon,
            type: type,
            isPassword: false,
            validate: (value) {
              if (value!.isEmpty) {
                print('Feild must not empty');
              } else {
                return null;
              }
            },
            onTap: onTap,
            suffixPressed: suffixPressed,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            suffixIcon: suffixIcon,
            maxLine: maxLine,
            minLine: minLine,
            label: label,
          ),
        ],
      ),
    );
  }
}
