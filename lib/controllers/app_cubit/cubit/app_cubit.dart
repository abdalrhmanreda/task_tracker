import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/views/archived_view/archived_view.dart';
import 'package:todo_app/views/done_view/done_view.dart';
import 'package:todo_app/views/home_view/home_view.dart';

import '../../../core/constant/constant.dart';
import '../../../models/user_model/user_model.dart';
import '../../../network/local/cache_helper.dart';
import '../../../views/settings_view/settings_view.dart';
import '../states/states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialAppState());
  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(
      icon: Icon(
        IconlyBroken.document,
      ),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(IconlyBroken.shieldDone),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(IconlyBroken.bookmark),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(IconlyBroken.setting),
      label: '',
    ),
  ];

  List<String> titles = [
    'Tasks',
    'Done',
    'Archived',
    'Settings',
  ];

  List<Widget> views = [
    HomeView(),
    DoneView(),
    ArchivedView(),
    SettingsView(),
  ];

  void changeNav(int index) {
    currentIndex = index;
    emit(ChangeNavBarState());
  }

  late Database database;
  void createDataBase() async {
    database = await openDatabase(
      'tasks.db',
      version: 1,
      onCreate: (db, version) {
        db
            .execute(
                'CREATE TABLE tasks(id INTEGER PRIMARY KEY , title TEXT ,category TEXT ,date TEXT,startTime TEXT , endTime TEXT , description TEXT , status TEXT )')
            .then((value) {
          emit(CreateDataBaseSuccessState());
        }).catchError((error) {
          emit(CreateDataBaseErrorState());
        });
      },
      onOpen: (db) {
        emit(OpenDataBaseSuccessState());
        getDataFromDatabase(db);
      },
    );
  }

  void insertIntoDataBase({
    required String title,
    required String category,
    required String date,
    required String startTime,
    required String endTime,
    required String description,
  }) async {
    await database.transaction((txn) {
      return txn.rawInsert(
          'INSERT INTO tasks(title, category, date , startTime , endTime , description , status ) VALUES("$title", "$category", "$date" , "$startTime" , "$endTime" , "$description", "new" )');
    }).then((value) {
      print(value);
      getDataFromDatabase(database);
      emit(InsertIntoDataBaseSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(InsertIntoDataBaseErrorState());
    });
  }

  List<Map> tasks = [];
  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archivedTasks = [];
  void getDataFromDatabase(database) async {
    newTasks = [];
    doneTasks = [];
    archivedTasks = [];
    emit(GetDataFromDatabaseLoadingState());
    try {
      tasks = await database.rawQuery('SELECT * from tasks');
      emit(GetDataFromDatabaseSuccessState());
      tasks.forEach((element) {
        if (element['status'] == 'new') {
          newTasks.add(element);
        } else if (element['status'] == 'done') {
          doneTasks.add(element);
        } else if (element['status'] == 'archive') {
          archivedTasks.add(element);
        } else if (element['status'] == 'delete') {
          deleteData(id: element['id']);
        }
      });
    } catch (e) {
      print(e.toString());
      emit(GetDataFromDatabaseErrorState());
    }
  }

  void updateData({required String status, required int id}) {
    database.rawUpdate(
        'UPDATE tasks SET status=? where id = ?', [status, id]).then((value) {
      getDataFromDatabase(database);
      emit(UpdateDataSuccessState());
    }).catchError((error) {
      emit(UpdateDataErrorState());
    });
  }

  void deleteData({required int id}) {
    database.rawDelete('DELETE FROM tasks where id = ?', [id]).then((value) {
      emit(DeleteDataSuccessState());
    }).catchError((error) {
      emit(DeleteDataErrorState());
    });
  }

  UserModel? userModel;

  void getUserData() {
    emit(GetUserDataStateLoading());
    FirebaseFirestore.instance
        .collection('users')
        .doc('l5LBPV1QyyP0Fi0cO4ssNmqnQJM2')
        .get()
        .then((value) {
      userModel = UserModel.fromJson(value.data()!);
      emit(GetUserDataStateSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(GetUserDataStateError());
    });
  }

  void logout() {
    FirebaseAuth.instance.signOut().then((value) {
      emit(LogoutSuccessState());
    }).catchError((error) {
      emit(LogoutErrorState());
    });
  }

  bool isDark = false;
  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
    } else {
      isDark = !isDark;
      CacheHelper.saveData(key: 'isDark', value: isDark).then((value) {
        emit(ChangeAppModeState());
      });
    }
  }
}
