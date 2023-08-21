import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo_app/core/components/custom_navigatation.dart';
import 'package:todo_app/views/add_new_task_view/add_new_task.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../controllers/app_cubit/cubit/app_cubit.dart';
import '../../controllers/app_cubit/states/states.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                cubit.titles[cubit.currentIndex],
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ToggleSwitch(
                    minWidth: 40,
                    minHeight: 10.0,
                    initialLabelIndex: AppCubit.get(context).isDark ? 0 : 1,
                    cornerRadius: 20.0,
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    totalSwitches: 2,
                    icons: const [
                      FontAwesomeIcons.lightbulb,
                      FontAwesomeIcons.solidLightbulb,
                    ],
                    iconSize: 20.0,
                    activeBgColors: const [
                      [Colors.black, Colors.black26],
                      [Colors.yellow, Colors.orange]
                    ],
                    animate:
                        true, // with just animate set to true, default curve = Curves.easeIn
                    curve: Curves
                        .bounceInOut, // animate must be set to true when using custom curve
                    onToggle: (index) {
                      AppCubit.get(context).changeAppMode();
                    },
                  ),
                ),
              ],
            ),
            body: cubit.views[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.items,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeNav(index);
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                CustomNavigation.navigateTo(context, CreateTaskView());
              },
              child: const Icon(
                IconlyBroken.edit,
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
          ),
        );
      },
    );
  }
}
