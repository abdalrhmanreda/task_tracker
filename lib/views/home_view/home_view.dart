import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/controllers/app_cubit/cubit/app_cubit.dart';
import 'package:todo_app/core/components/custom_navigatation.dart';
import 'package:todo_app/core/components/custom_size_box_height.dart';
import 'package:todo_app/views/add_new_task_view/add_new_task.dart';

import '../../controllers/app_cubit/states/states.dart';
import '../../core/components/task_item.dart';
import '../../generated/assets.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        List<Map> tasks = AppCubit.get(context).newTasks;
        return ConditionalBuilder(
          condition:
              tasks.isNotEmpty && state is! GetDataFromDatabaseLoadingState,
          builder: (context) => ListView.separated(
            itemBuilder: (context, index) =>
                buildContainerTask(context, tasks, index, () {
              AppCubit.get(context)
                  .updateData(status: 'done', id: tasks[index]['id']);
            }, () {
              AppCubit.get(context)
                  .updateData(status: 'archive', id: tasks[index]['id']);
            }, () {
              AppCubit.get(context)
                  .updateData(status: 'delete', id: tasks[index]['id']);
            }, () {
              CustomNavigation.navigateTo(context, CreateTaskView());
            }),
            separatorBuilder: (context, index) => CustomSizedBoxHeight(
              height: 50,
            ),
            itemCount: tasks.length,
          ),
          fallback: (context) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                Assets.imagesEmptyCuate,
              ),
              Text(
                'No tasks added yet',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 20,
                    ),
              ),
            ],
          ),
        );
      },
    );
  }
}
