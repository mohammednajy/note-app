class Note {
  late int id;
  late String title;
  late String details;
  late int color;
Note();
  // fromMap to read form database
  Note.fromMap(Map<String,dynamic> rowMap){
    id=rowMap['id'];
    title=rowMap['title'];
    details=rowMap['details'];
    color=rowMap['color'];
  }

  // toMap to store on database
  Map<String ,dynamic> toMap(){
    Map<String ,dynamic>map=<String,dynamic>{};
    map['title']=title;
    map['details']=details;
    map['color']=color;
   return map;
  }
  
}

