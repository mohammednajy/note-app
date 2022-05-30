
import '../../models/note.dart';

abstract class DbOperations<T>{

  Future<int> create(NoteModel Object);
  Future<List<NoteModel>> read();
  Future<bool> update(NoteModel Object);
  Future<bool> delete(int id);
  Future<NoteModel?> show(int id);



}