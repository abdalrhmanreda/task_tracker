import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/controllers/app_cubit/cubit/app_cubit.dart';
import 'package:todo_app/controllers/app_cubit/states/states.dart';
import 'package:todo_app/core/components/build_task_item_feild.dart';
import 'package:todo_app/core/components/custom_button.dart';
import 'package:todo_app/core/components/custom_navigatation.dart';
import 'package:todo_app/core/components/custom_size_box_width.dart';
import 'package:todo_app/core/components/flutter_toast.dart';
import 'package:todo_app/views/layout_view/layout_view.dart';

import '../../core/style/style.dart';

class CreateTaskView extends StatefulWidget {
  const CreateTaskView({super.key});

  @override
  State<CreateTaskView> createState() => _CreateTaskViewState();
}

class _CreateTaskViewState extends State<CreateTaskView> {
  TextEditingController titleController = TextEditingController();

  TextEditingController dateController = TextEditingController();

  TextEditingController startTimeController = TextEditingController();

  TextEditingController endTimeController = TextEditingController();

  TextEditingController categoryController = TextEditingController();

  TextEditingController descController = TextEditingController();

  GlobalKey formKey = GlobalKey<FormState>();
  ScrollController scrollController = ScrollController();
  List<String> buttons = ['Development', 'Design', 'Research', 'other'];

  int tag = 1;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is InsertIntoDataBaseSuccessState) {
          showToast(
              message: 'Task Added Successfully', state: ToastState.SUCCESS);
          CustomNavigation.navigateAndFinish(context, const LayoutView());
        }
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                'Create task',
              ),
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  IconlyBroken.arrow_left_2,
                ),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
                vertical: 15.h,
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: Form(key: formKey, child: buildTaskView(context, cubit)),
              ),
            ),
          ),
        );
      },
    );
  }

  Column buildTaskView(BuildContext context, AppCubit cubit) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BuildTaskItemFeild(
          title: 'Task Name',
          label: 'Task name',
          type: TextInputType.text,
          controller: titleController,
          hint: 'Ui Design',
          height: 40,
          maxLine: 1,
          minLine: 1,
          textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
        ),
        Text(
          'Category',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
        ),
        ChipsChoice.single(
          value: tag,
          onChanged: (value) => setState(() {
            tag = value;
            categoryController.text = buttons[tag];
          }),
          choiceItems: C2Choice.listFrom(
              source: buttons, value: (i, v) => i, label: (i, v) => v),
        ),
        BuildTaskItemFeild(
          title: 'Date & Time',
          label: 'Date',
          suffixIcon: IconlyBroken.calendar,
          suffixPressed: () {
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(2025),
            ).then((value) {
              dateController.text =
                  DateFormat('d MMMM. EEEE', 'en').format(value!);
            });
          },
          controller: dateController,
          height: 40,
          type: TextInputType.text,
          maxLine: 1,
          minLine: 1,
          textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: BuildTaskItemFeild(
                title: 'Start Time',
                label: 'Start Time',
                controller: startTimeController,
                hint: 'Start Time',
                height: 40,
                maxLine: 1,
                type: TextInputType.text,
                suffixIcon: IconlyBroken.time_circle,
                suffixPressed: () {
                  showTimePicker(context: context, initialTime: TimeOfDay.now())
                      .then((value) {
                    startTimeController.text = value!.format(context);
                  });
                },
                minLine: 1,
                textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
              ),
            ),
            CustomSizedBoxWidth(
              width: 40,
            ),
            Expanded(
              child: BuildTaskItemFeild(
                title: 'End Time',
                label: 'End Time',
                controller: endTimeController,
                hint: 'End Time',
                suffixIcon: IconlyBroken.time_circle,
                suffixPressed: () {
                  showTimePicker(context: context, initialTime: TimeOfDay.now())
                      .then((value) {
                    endTimeController.text = value!.format(context);
                  });
                },
                type: TextInputType.text,
                height: 40,
                maxLine: 1,
                minLine: 1,
                textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
              ),
            ),
          ],
        ),
        BuildTaskItemFeild(
          title: 'Description',
          scrollController: scrollController,
          label: 'Description',
          prefixIcon: IconlyBroken.document,
          type: TextInputType.multiline,
          controller: descController,
          height: 40,
          maxLine: null,
          minLine: null,
          textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
        ),
        CustomButton(
          onPressed: () {
            cubit.insertIntoDataBase(
              title: titleController.text,
              category: categoryController.text,
              date: dateController.text,
              startTime: startTimeController.text,
              endTime: endTimeController.text,
              description: descController.text,
            );
          },
          text: 'Create Task',
          height: 47.h,
          width: MediaQuery.of(context).size.width,
          vertical: 10.h,
          horizontal: 0,
          color: Style.kPrimaryColor,
          textColor: 0xffffffff,
          radius: 10,
        ),
      ],
    );
  }
}
