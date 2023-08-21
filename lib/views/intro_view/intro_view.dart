import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/components/custom_navigatation.dart';
import 'package:todo_app/views/get_started_view/get_started_view.dart';
import 'package:todo_app/views/layout_view/layout_view.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

import '../../core/constant/constant.dart';
import '../../core/style/style.dart';
import '../../generated/assets.dart';

class IntroView extends StatelessWidget {
  const IntroView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WidgetAnimator(
              atRestEffect: WidgetRestingEffects.rotate(numberOfPlays: 3),
              child: Image.asset(
                Assets.imagesThaneder,
                width: 200.w,
                color: const Color(Style.kPrimaryColor),
              ),
            ),
            DefaultTextStyle(
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 33.sp,
                    color: const Color(Style.kPrimaryColor),
                    fontWeight: FontWeight.bold,
                  ),
              child: AnimatedTextKit(
                onFinished: () {
                  if (userId != null) {
                    CustomNavigation.navigateAndReplacement(
                      context,
                      const LayoutView(),
                    );
                  } else {
                    CustomNavigation.navigateAndReplacement(
                      context,
                      const GetStartedView(),
                    );
                  }
                },
                totalRepeatCount: 4,
                animatedTexts: [
                  TyperAnimatedText(
                    'Task Tracker',
                    speed: const Duration(
                      milliseconds: 75,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
