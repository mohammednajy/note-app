

import 'package:flutter/material.dart';
import 'package:note_app/controllers/note_db_controllers.dart';
import 'package:note_app/models/note.dart';

class NoteProvider extends ChangeNotifier{
  List<NoteModel> notes= <NoteModel>[];
  NoteDbController _noteDbController = NoteDbController();

  Future <bool> create({required NoteModel note}) async {
    int newRowId= await _noteDbController.create(note);
    if(newRowId!=0){
      note.id=newRowId;
      notes.add(note);
      notifyListeners();
    }
     return newRowId !=0;
  }
  
  Future <void> read() async {
    notes= await _noteDbController.read();
    notifyListeners();
  }

  Future<bool> update({required NoteModel note}) async {
        bool updated = await _noteDbController.update(note);
        if(updated){
          int index= notes.indexWhere((element) => element.id == note.id);
          if(index != -1){
            notes[index]=note;
          }
          notifyListeners();
        }
        return updated;
  }
    Future<bool> delete({required int id}) async{
     bool deleted = await _noteDbController.delete(id);
     if(deleted){
      notes.removeWhere((element) => element.id==id);
      notifyListeners();
     }
     return deleted;
    }

}