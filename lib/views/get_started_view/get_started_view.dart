import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/generated/assets.dart';
import 'package:todo_app/views/login_view/login_view.dart';

import '../../core/components/custom_button.dart';
import '../../core/components/custom_navigatation.dart';
import '../../core/components/custom_size_box_width.dart';
import '../../core/style/style.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 20,
          vertical: MediaQuery.of(context).size.height / 20,
        ),
        child: buildGetStartedView(context),
      ),
    );
  }

  Column buildGetStartedView(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            const CircleAvatar(
              backgroundColor: Colors.black,
              child: Icon(
                IconlyBroken.arrowLeftCircle,
                color: Colors.white,
              ),
            ),
            CustomSizedBoxWidth(
              width: 50,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'How it',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 18,
                        ),
                  ),
                  TextSpan(
                    text: ' works',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: const Color(Style.kPrimaryColor),
                          fontSize: 18,
                        ),
                  ),
                ],
              ),
            )
          ],
        ),
        SvgPicture.asset(
          Assets.imagesStudyingAmico,
          height: 300.h,
        ),
        Text(
          'Manage Your\nEveryday task list',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 20.sp,
                fontWeight: FontWeight.w800,
              ),
        ),
        Text(
          'Streamline your productivity and effortlessly\nconquer your to-do list with our intuitive and\nfeature-rich todo app designed to keep you \norganized and motivated',
          style: Theme.of(context).textTheme.caption!.copyWith(
                fontSize: 13.sp,
                height: 1.4,
              ),
          textAlign: TextAlign.center,
        ),
        CustomButton(
          text: 'Get Started',
          onPressed: () {
            CustomNavigation.navigateAndFinish(context, LoginView());
          },
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 20,
          color: Style.kPrimaryColor,
          radius: 15,
          textColor: 0xffffffff,
          horizontal: 0,
          vertical: 0,
        ),
      ],
    );
  }
}
