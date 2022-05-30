
import 'package:note_app/storage/db/db_opreations.dart';
import 'package:note_app/storage/db/db_provider.dart';
import 'package:sqflite/sqflite.dart';
import '../models/note.dart';

class NoteDbController extends DbOperations{
  Database database = DbProvider().database;

  @override
  Future<int> create(NoteModel Object) async {
   int newRowId = await database.insert('notes', Object.toMap());
   return newRowId;
  }

  @override
  Future<bool> delete(int id) async {
    int countsOfDeletedRows= await database.delete('notes',where: 'id= ?',whereArgs: [id]);
    return countsOfDeletedRows > 0;
  }

  @override
  Future<List<NoteModel>> read() async {
    List<Map<String, dynamic?>> data = await database.query('notes');
    print("all $data");
    return data.map((rowMap) => NoteModel.fromMap(rowMap)).toList();
  }

  @override
  Future<NoteModel?> show(int id) async {
    List<Map<String, Object?>> data = await database.query('notes',where: 'id=?',whereArgs: [id]);
    if(data.isNotEmpty){
      return NoteModel.fromMap(data.first);
    }
    return null;
  }

  @override
  Future<bool> update(NoteModel Object) async {
    int countsOfUpdatedRows = await database.update('notes',  Object.toMap(),where: 'id = ?',whereArgs: [Object.id]);
    return countsOfUpdatedRows > 0;
  } 
}