import 'package:flutter/cupertino.dart';
import 'package:note_app/database/controller/note_db_controller.dart';
import 'package:note_app/models/note.dart';

class NoteProvider extends ChangeNotifier {
  List<Note> notes = <Note>[];

  final NoteDbController _dbController = NoteDbController();

  void read() async {
    notes = await _dbController.read();
    notifyListeners();
  }

  Future<bool> create({required Note note}) async {
    int newRowId = await _dbController.create(note);

    if (newRowId != 0) {
      note.id = newRowId;
      notes.add(note);
      notifyListeners();
    }
    return newRowId != 0;
  }

  Future<bool> delete(int index) async {
    bool deleted = await _dbController.delete(notes[index].id);
    if (deleted) {
      notes.removeAt(index);
      notifyListeners();
    }
    return deleted;
  }

  Future<bool> update(Note updatedNote) async {
    bool updated = await _dbController.update(updatedNote);
    if (updated) {
      int index = notes.indexWhere((element) => element.id == updatedNote.id);

      if (index != -1) {
        notes[index] = updatedNote;
        notifyListeners();
      }
    }
    return updated;
  }
}
