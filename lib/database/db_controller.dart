//singlton for database
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';



class DbController {
  static final DbController _instance = DbController._();
  late Database _database;
  factory DbController() {
    return _instance;
  }
  DbController._();

  Database get database =>_database;

  Future<void> initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path,'db.spl');
    _database =await openDatabase(
      path,
      version: 1,
      onOpen: (Database db){},
      onCreate: (Database db,int version)async {
       await  db.execute('CREATE TABLE notes ('
        'id INTEGER PRIMARY KEY AUTOINCREMENT,'
        'title TEXT,'
        'details TEXT,'
        'color INTEGER'
        ')');
      },
      onUpgrade: (Database db,int oldVersion,int newVersion){}, 
      onDowngrade: (Database db, int oldVersion, int newVersion) {},
    );
  }
}
