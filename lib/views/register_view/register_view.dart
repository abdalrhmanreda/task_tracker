import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:todo_app/network/local/cache_helper.dart';
import 'package:todo_app/views/login_view/login_view.dart';

import '../../controllers/register_controller/register_cubit/register_cubit.dart';
import '../../controllers/register_controller/register_states/register_states.dart';
import '../../core/components/custom_button.dart';
import '../../core/components/custom_divider.dart';
import '../../core/components/custom_navigatation.dart';
import '../../core/components/custom_text_form_feild.dart';
import '../../core/components/flutter_toast.dart';
import '../../core/components/progress_indector.dart';
import '../../core/style/style.dart';
import '../../generated/assets.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var emailController = TextEditingController();
    var nameController = TextEditingController();
    var passController = TextEditingController();
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if (state is CreateUserSuccessState) {
          showToast(
              message: 'created Account Successfully',
              state: ToastState.SUCCESS);
          CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
            CustomNavigation.navigateAndFinish(context, LoginView());
          });
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 15),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  child: buildRegisterView(context, nameController,
                      emailController, passController, state),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Column buildRegisterView(
      BuildContext context,
      TextEditingController nameController,
      TextEditingController emailController,
      TextEditingController passController,
      RegisterStates state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          Assets.imagesLoginRemovebgPreview,
          height: MediaQuery.of(context).size.height / 3,
        ),
        Text(
          'Sign Up',
          style: GoogleFonts.aBeeZee(
            fontSize: 30.sp,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 50,
        ),
        CustomTextFormField(
          isPassword: false,
          controller: nameController,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Color(Style.kPrimaryColor))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Color(Style.kPrimaryColor))),
          onSubmitted: (value) {
            return null;
          },
          validate: (value) {
            if (value!.isEmpty) {
              return 'Should enter your name';
            } else {
              return null;
            }
          },
          prefixIcon: IconlyBroken.profile,
          label: 'Full name',
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 50,
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
            if (value!.isEmpty) {
              return 'Should enter your email';
            } else {
              return null;
            }
          },
          prefixIcon: IconlyBroken.message,
          label: 'Email Address',
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 50,
        ),
        CustomTextFormField(
          maxLine: 1,
          isPassword: true,
          controller: passController,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          onSubmitted: (value) {},
          validate: (value) {
            if (value!.isEmpty) {
              return 'Should enter your password';
            } else {
              return null;
            }
          },
          prefixIcon: IconlyBroken.lock,
          label: 'Password',
          suffixIcon: IconlyBroken.hide,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 40,
        ),
        ConditionalBuilder(
          condition: state is! SignUpLoadingState,
          builder: (context) => CustomButton(
            onPressed: () {
              RegisterCubit.get(context).signUp(
                  name: nameController.text,
                  password: passController.text,
                  email: emailController.text,
                  age: '19',
                  gender: 'male');
            },
            text: 'Sign up',
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
        SizedBox(
          height: MediaQuery.of(context).size.height / 40,
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
          height: MediaQuery.of(context).size.height / 60,
        ),
        InkWell(
          onTap: () {},
          child: Container(
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
                  'Sign up with google',
                  style: Theme.of(context).textTheme.titleSmall,
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 110,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Already have an account?'),
            CustomButton(
              onPressed: () {
                Navigator.pop(context);
              },
              text: 'Login',
              textColor: Style.kPrimaryColor,
              color: 0xff,
              horizontal: 0,
              vertical: 0,
              radius: 0,
            )
          ],
        ),
      ],
    );
  }
}
