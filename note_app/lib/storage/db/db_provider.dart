import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbProvider {
  static final DbProvider _instance = DbProvider._internal();
  late Database _database;
  factory DbProvider(){
    return _instance;
  }
  DbProvider._internal();
  Database get database => _database;


  Future<void> initDb() async {
    Future<Directory> directory= getApplicationDocumentsDirectory();
    String path= join(directory.toString(),'note_db.sql');
    _database = await openDatabase(path,version: 1,
    onOpen: (Database db){},
    onCreate: (Database db, int version ) async{
      db.execute('CREATE TABLE notes ('
      'id INTEGER PRIMARY KEY AUTOINCREMENT,'
      'title TEXT,'
      'content TEXT,'
      'color TEXT'
      ')');
    },
    ); 
  }
}