import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:todo_app/controllers/app_cubit/cubit/app_cubit.dart';
import 'package:todo_app/controllers/app_cubit/states/states.dart';
import 'package:todo_app/core/components/custom_divider.dart';
import 'package:todo_app/core/components/custom_navigatation.dart';
import 'package:todo_app/core/components/custom_size_box_height.dart';
import 'package:todo_app/core/style/style.dart';
import 'package:todo_app/models/user_model/user_model.dart';
import 'package:todo_app/views/login_view/login_view.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is LogoutSuccessState) {
          CustomNavigation.navigateAndFinish(context, LoginView());
        }
      },
      builder: (context, state) {
        List<ListTileItem> list = [
          ListTileItem('Notifications', IconlyBroken.notification, () {}),
          ListTileItem('language', Icons.translate_outlined, () {}),
          ListTileItem('privacy', IconlyBroken.lock, () {}),
          ListTileItem('Help Center', Icons.help_outline, () {}),
          ListTileItem('Log out', IconlyBroken.logout, () {
            AppCubit.get(context).logout();
          }),
        ];
        UserModel? userModel = AppCubit.get(context).userModel;

        return Padding(
          padding: EdgeInsets.symmetric(vertical: 15.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Account',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 18,
                      ),
                ),
              ),
              CustomSizedBoxHeight(
                height: 40,
              ),
              ListTile(
                onTap: () {},
                leading: const CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      'https://img.freepik.com/free-vector/isolated-young-handsome-man-different-poses-white-background-illustration_632498-855.jpg?w=740&t=st=1690374148~exp=1690374748~hmac=b04175c4106ba1a135929d9ae938ebb50b403cb7709bcb3f11869ae07cd69b2d'),
                ),
                title: Text(
                  '${userModel!.name}',
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    IconlyBroken.arrow_right_2,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
              ),
              CustomSizedBoxHeight(
                height: 40,
              ),
              myDivider(MediaQuery.of(context).size.width, 1),
              CustomSizedBoxHeight(
                height: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                    list.map((e) => buildListTileItem(e, context)).toList(),
              ),
            ],
          ),
        );
      },
    );
  }

  ListTile buildListTileItem(ListTileItem e, BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: const Color(Style.kPrimaryColor),
        child: Icon(
          e.icon,
          color: Colors.white,
        ),
      ),
      title: Text(
        e.title,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 15,
            ),
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(
          IconlyBroken.arrow_right_2,
        ),
      ),
      style: Theme.of(context).listTileTheme.style,
      onTap: e.voidCallback,
    );
  }
}

class ListTileItem {
  String title;
  IconData icon;
  VoidCallback voidCallback;

  ListTileItem(this.title, this.icon, this.voidCallback);
}
