import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({super.key, this.actions, this.leading, this.title});

  List<Widget>? actions;
  String? title;
  Widget? leading;

  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      actions: actions,
      title: Text(
        title!,
      ),
      leading: leading,
    );
  }
}
