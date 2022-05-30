import 'dart:ffi';

import 'package:note_app/database/db_controller.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/note.dart';

class NoteDbController {
  Database database = DbController().database;

  Future<int> create(Note note) async {
    int newRowId = await database.insert('notes', note.toMap());
    return newRowId;
  }

  Future<bool> delete(int id) async {
    int countOfDeletedRows =
        await database.delete('notes', where: 'id = ?', whereArgs: [id]);
    return countOfDeletedRows == 1;
  }

  Future<List<Note>> read() async {
    List<Map<String, dynamic>> rows = await database.query('notes');
    return rows
        .map((Map<String, dynamic> rowMap) => Note.fromMap(rowMap))
        .toList();
  }

  Future<Note?> show(int id) async {
    List<Map<String, dynamic>> rows =
        await database.query('notes', where: 'id=?', whereArgs: [id]);
    if (rows.isNotEmpty) {
      return Note.fromMap(rows.first);
    }
    return null;
  }

  Future<bool> update(Note note) async{
    int countOfUpdatedRows=await database.update('notes', note.toMap(),where: 'id=?',whereArgs: [note.id]);
  
  return countOfUpdatedRows==1;
  }

 
}
