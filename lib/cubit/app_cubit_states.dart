import "package:equatable/equatable.dart";
import "package:flutter_cubit/model/data_model.dart";

abstract class CubitStates extends Equatable {}

class InitialState extends CubitStates {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class WelcomeState extends CubitStates {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class AuthState extends CubitStates {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class LoadingState extends CubitStates {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class LoadedState extends CubitStates {
  // final List<DataModel> places;
  List? courses;
  LoadedState({this.courses});
  @override
  // TODO: implement props
  List<Object?> get props => [courses];
}

class CourseState extends CubitStates {
  List? lessons;
  CourseState({this.lessons});
  @override
  // TODO: implement props
  List<Object?> get props => [lessons];
}

class LessonState extends CubitStates {
  List? lesson;
  LessonState({this.lesson});
  @override
  // TODO: implement props
  List<Object?> get props => [lesson];
}

class BookmarksState extends CubitStates {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class RecycleBinState extends CubitStates {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
