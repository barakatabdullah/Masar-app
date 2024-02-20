import "package:bloc/bloc.dart";
import "package:flutter/material.dart";
import "package:flutter_cubit/cubit/app_cubit_states.dart";
import "package:flutter_cubit/database/sqlflite.dart";
import "package:flutter_cubit/services/data_services.dart";
import 'package:shared_preferences/shared_preferences.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({this.data}) : super(InitialState()) {
    startApp();
  }

  final DataServices? data;
  late final places;
  late var courses;

  Future<void> startApp() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? initiated = await prefs.getBool("Initiated");
    final bool? darkMode = await prefs.getBool("darkMode");
    // ThemeCubit().setMode(darkMode? darkMode : true);

    final db = await openMyDatabase();

    if (initiated == null) {
      emit(WelcomeState());
    } else {
      emit(AuthState());
    }
  }

  Future<void> auth() async {
    try {
      emit(AuthState());
    } catch (e) {
      print(e);
    }
  }

  Future<void> course({required id}) async {
    final db = await openMyDatabase();
    try {
      var lessons = await db.rawQuery('SELECT * FROM LESSONS WHERE courseId = ?',[id]);
      emit(CourseState(lessons: lessons));
    } catch (e) {
      print(e);
    }
  }

  Future<void> lesson({required id}) async {
    final db = await openMyDatabase();
    try {
      var lesson = await db.rawQuery('SELECT * FROM LESSONS WHERE id = ?',[id]);
      emit(LessonState(lesson: lesson));
    } catch (e) {
      print(e);
    }
  }

  Future<void> home() async {

    try {
      emit(LoadingState());
      final db = await openMyDatabase();
      courses =await db.rawQuery('SELECT * FROM COURSES');
      emit(LoadedState(courses: courses));
    } catch (e) {
      print(e);
    }
  }

  Future<void> onlogin({required username, required password}) async {
    emit(LoadingState());
    final db = await openMyDatabase();
    try {
      var user = await db.rawQuery(
        'SELECT * FROM USERS WHERE username = ?',
        [username],
      );
      if (user == null || user.length == 0) {
        emit(AuthState());
      } else if (user[0]['password'] == password) {
        try {
          courses =await db.rawQuery('SELECT * FROM COURSES');
          emit(LoadedState(courses: courses));
        } catch (e) {
          print(e);
        }
      }
    } catch (e) {
      print(e);
    }
  }



  // Future<void> getData() async {
  //   try {
  //     emit(LoadingState());
  //     // places = await data?.getInfo();
  //     // print(places.length);
  //     emit(LoadedState());
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}

class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(false);

  void toggleMode() => emit(!state);
  void setMode(bool mode) => emit(mode);
}
