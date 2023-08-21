import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:todo_app/controllers/app_cubit/cubit/app_cubit.dart';
import 'package:todo_app/controllers/app_cubit/observer/blocObserver.dart';
import 'package:todo_app/controllers/app_cubit/states/states.dart';
import 'package:todo_app/controllers/login_controller/login_cubit/login_cubit.dart';
import 'package:todo_app/core/style/style.dart';
import 'package:todo_app/network/local/cache_helper.dart';
import 'package:todo_app/views/intro_view/intro_view.dart';

import 'controllers/register_controller/register_cubit/register_cubit.dart';
import 'core/constant/constant.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting();
  CacheHelper.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  userId = CacheHelper.getData(key: 'uId');
  Bloc.observer = MyBlocObserver();
  runApp(TaskTickerApp());
}

class TaskTickerApp extends StatelessWidget {
  TaskTickerApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit()
            ..createDataBase()
            ..getUserData(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
      ],
      child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return BlocConsumer<AppCubit, AppStates>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  home: const IntroView(),
                  theme: Style.lightTheme,
                  darkTheme: Style.darkTheme,
                  themeMode: AppCubit.get(context).isDark
                      ? ThemeMode.dark
                      : ThemeMode.light,
                );
              },
            );
          }),
    );
  }
}
