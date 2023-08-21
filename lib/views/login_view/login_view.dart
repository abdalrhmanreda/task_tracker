import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:todo_app/views/layout_view/layout_view.dart';
import 'package:todo_app/views/register_view/register_view.dart';

import '../../controllers/login_controller/login_cubit/login_cubit.dart';
import '../../controllers/login_controller/login_states/login_states.dart';
import '../../core/components/custom_button.dart';
import '../../core/components/custom_divider.dart';
import '../../core/components/custom_navigatation.dart';
import '../../core/components/custom_text_form_feild.dart';
import '../../core/components/flutter_toast.dart';
import '../../core/components/progress_indector.dart';
import '../../core/style/style.dart';
import '../../generated/assets.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  var emailController = TextEditingController();
  var passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          showToast(message: 'login Successfully', state: ToastState.SUCCESS);
          CustomNavigation.navigateAndFinish(context, const LayoutView());
        } else if (state is LoginErrorState) {
          showToast(message: state.error, state: ToastState.ERROR);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 15),
              child: Form(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  child: buildLoginView(context, state),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Column buildLoginView(BuildContext context, LoginStates state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            Assets.imagesSignUpRemovebgPreview,
            height: 200.h,
          ),
        ),
        Text(
          'Sign in',
          style:
              GoogleFonts.aBeeZee(fontSize: 30.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 25,
        ),
        CustomTextFormField(
          isPassword: false,
          controller: emailController,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          onSubmitted: (value) {
            return null;
          },
          validate: (value) {
            return null;
          },
          prefixIcon: IconlyBroken.message,
          label: 'Email Address',
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 30,
        ),
        CustomTextFormField(
          isPassword: true,
          maxLine: 1,
          controller: passController,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          onSubmitted: (value) {
            return null;
          },
          validate: (value) {
            return null;
          },
          prefixIcon: IconlyBroken.lock,
          label: 'Password',
          suffixIcon: IconlyBroken.hide,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 30,
        ),
        ConditionalBuilder(
          condition: state is! LoginLoadingState,
          builder: (context) => CustomButton(
            onPressed: () {
              LoginCubit.get(context).loginUser(
                  email: emailController.text, password: passController.text);
            },
            text: 'Sign in',
            height: 44.h,
            width: MediaQuery.of(context).size.width,
            radius: 15,
            color: Style.kPrimaryColor,
            textColor: 0xffffffff,
            vertical: 0,
            horizontal: 0,
            fontSize: 16,
          ),
          fallback: (context) => const SpecialIndicator(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              onPressed: () {
                // Navigatation.navigateTo(
                //     context, ForgetPassScreen());
              },
              text: 'Forget Password ?',
              textColor: Style.kPrimaryColor,
              color: 0xff,
              horizontal: 0,
              vertical: 0,
              radius: 0,
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            myDivider(MediaQuery.of(context).size.width / 2.9, 1),
            SizedBox(
              width: MediaQuery.of(context).size.width / 35,
            ),
            const Text('or'),
            SizedBox(
              width: MediaQuery.of(context).size.width / 35,
            ),
            myDivider(MediaQuery.of(context).size.width / 2.94, 1),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 30,
        ),
        Container(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width / 50),
          decoration: BoxDecoration(
              color: const Color(0xfff0f5f6),
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Logo(Logos.google),
              SizedBox(
                width: MediaQuery.of(context).size.width / 30,
              ),
              Text(
                'Login with google',
                style: Theme.of(context).textTheme.titleSmall,
              )
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 50,
        ),
        Center(
          child: CustomButton(
            onPressed: () {
              CustomNavigation.navigateTo(context, const RegisterView());
            },
            text: 'Create account ?',
            textColor: Style.kPrimaryColor,
            color: 0xff,
            horizontal: 0,
            vertical: 0,
            radius: 0,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
