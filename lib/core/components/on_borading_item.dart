import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoradingItem {
  IconData? icon;
  String? title;
  String? caption;
  String? image;

  OnBoradingItem({this.icon, this.title, this.caption, this.image});
}

class OnBorading extends StatelessWidget {
  OnBorading({super.key, this.onBoradingItem});
  OnBoradingItem? onBoradingItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          onBoradingItem!.image!,
          height: MediaQuery.of(context).size.height / 3,
          width: MediaQuery.of(context).size.width,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 40,
        ),
        Text(
          onBoradingItem!.caption!,
          style: GoogleFonts.aBeeZee(
            color: Colors.grey,
            fontSize: 15.sp,
          ),
        ),
      ],
    );
  }
}
