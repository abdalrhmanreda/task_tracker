import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_size_box_height.dart';
import 'custom_size_box_width.dart';

List<String> feature = ['Done', 'Archived', 'Delete', 'Edit'];

Container buildContainerTask(
  BuildContext context,
  List<Map<dynamic, dynamic>> tasks,
  int index,
  VoidCallback? doneFunction,
  VoidCallback? archiveFunction,
  VoidCallback? deleteFunction,
  VoidCallback? editFunction,
) {
  return Container(
    width: MediaQuery.of(context).size.width,
    margin: const EdgeInsets.all(15),
    padding: EdgeInsets.symmetric(
      horizontal: 15.w,
      vertical: 15.h,
    ),
    decoration: BoxDecoration(
      color: const Color(0xfff8f8f8),
      borderRadius: BorderRadius.circular(15),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${tasks[index]['title']}',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              '(${tasks[index]['category']})',
              style: Theme.of(context).textTheme.caption,
            ),
            const Spacer(),
            DropdownButton(
              underline: Container(),
              icon: const Icon(
                IconlyBroken.moreCircle,
              ),
              items: feature
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
              onChanged: (value) {},
            ),
          ],
        ),
        CustomSizedBoxHeight(
          height: 90,
        ),
        Text(
          '${tasks[index]['description']}',
          style: Theme.of(context).textTheme.caption,
        ),
        CustomSizedBoxHeight(
          height: 70,
        ),
        Row(
          children: [
            Icon(
              color: Theme.of(context).textTheme.titleSmall!.color,
              IconlyBroken.timeCircle,
            ),
            CustomSizedBoxWidth(
              width: 50,
            ),
            Text(
              '${tasks[index]['startTime']} - ${tasks[index]['endTime']}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
        CustomSizedBoxHeight(
          height: 70,
        ),
        Row(
          children: [
            Icon(
                color: Theme.of(context).textTheme.titleSmall!.color,
                IconlyBroken.calendar),
            Text(
              '${tasks[index]['date']}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
        CustomSizedBoxHeight(
          height: 70,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: doneFunction,
              icon: const Icon(
                IconlyBroken.shieldDone,
                color: Colors.grey,
              ),
            ),
            IconButton(
              onPressed: editFunction,
              icon: const Icon(
                IconlyBroken.edit,
                color: Colors.grey,
              ),
            ),
            IconButton(
              onPressed: deleteFunction,
              icon: const Icon(
                IconlyBroken.delete,
                color: Colors.grey,
              ),
            ),
            IconButton(
              onPressed: archiveFunction,
              icon: const Icon(
                IconlyBroken.bookmark,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
