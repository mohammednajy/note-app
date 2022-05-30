import 'dart:convert';

import 'package:flutter/material.dart';

class NoteModel {
  late int id;
  late String title;
  late String content;
  late Color note_color = Colors.black;

  NoteModel();

  // NoteModel({required this.id, required this.title, required this.content});

  NoteModel.fromMap(Map<String, dynamic> rowMap) {
    id = rowMap['id'];
    title = rowMap['title'];
    content = rowMap['content'];
    print("st ${rowMap['color']}");
    note_color = Color(int.parse(rowMap['color']));
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['title'] = title;
    map['content'] = content;
    map['color'] = note_color.value.toString();
    return map;
  }
}
