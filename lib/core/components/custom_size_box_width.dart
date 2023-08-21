import 'package:flutter/material.dart';

class CustomSizedBoxWidth extends StatelessWidget {
  CustomSizedBoxWidth({
    super.key,
    this.width,
  });
  double? width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / width!,
    );
  }
}
