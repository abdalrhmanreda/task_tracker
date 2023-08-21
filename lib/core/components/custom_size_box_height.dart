import 'package:flutter/material.dart';

class CustomSizedBoxHeight extends StatelessWidget {
  CustomSizedBoxHeight({super.key, this.height});
  double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / height!,
    );
  }
}
