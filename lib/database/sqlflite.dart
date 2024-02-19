import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> openMyDatabase() async {
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, 'database.db');
  final database = await openDatabase(
    path,
    version: 1,
    onCreate: (db, version) async {
      // Create tables here
      await db.execute('''
          CREATE TABLE "USERS"(
          "id" INTEGER PRIMARY KEY AUTOINCREMENT,
          "username" TEXT NOT NULL,
          "password" TEXT NOT NULL
          )
          ''');
      await db.execute('''
          CREATE TABLE "COURSES"(
          "id" INTEGER PRIMARY KEY,
          "title" TEXT NOT NULL,
          "image" TEXT NOT NULL
          )
          ''');
      await db.execute('''
          CREATE TABLE "LESSONS"(
          "id" INTEGER PRIMARY KEY AUTOINCREMENT,
          "title" TEXT NOT NULL,
          "videoId" TEXT NOT NULL,
          "courseId" INTEGER, 
          FOREIGN KEY("courseId") REFERENCES COURSES("id")
          )
          ''');

      await db.insert(
        'USERS',
        {'username': 'user123', 'password': '12345678'},
      );

      await db.insert("COURSES",
        {
          'id':1,
          'title':'Flutter - MVC E-commerce course',
          'image':'flutterImg.jpg'
        },
      );
      await db.insert("COURSES",
        {
          'id':2,
          'title':'Vue.js Fundamentals',
          'image':'vueImg.jpg'
        },
      );
      await db.insert("COURSES",
        {
          'id':3,
          'title':'Photoshop for Beginners:Complete Course',
          'image':'photoshopImg.jpg'
        },
      );
      await db.insert("LESSONS",
      {
        'title':'introduction ( Ecommerce App ) (PHP - MYSQL - Flutter) ( 2023 )',
        'videoId':'vpEwyk4bJoY'
      }
      );

    },
  );
  return database;
}
