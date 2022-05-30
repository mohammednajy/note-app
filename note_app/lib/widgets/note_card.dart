import 'package:flutter/material.dart';
import '../screens/edit_note.dart';

class NoteCard extends StatelessWidget {
  late int id;
  late String title;
  late String content;
  late Color note_color = Colors.yellow;

  NoteCard({
    Key? key,
    required this.id,
    required this.deviceSize,
    required this.title,
    required this.content,
    required this.note_color,
  }) : super(key: key);

  final Size deviceSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditNote(
              id: id,
              content: content,
              title: title,
              note_color: note_color,
            ),
          ),
        ),
      },
      child: Container(
        height: 100,
        width: deviceSize.width,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          border: Border(
            left: BorderSide(color: note_color, width: 5),
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 177, 177, 177),
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 3.0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Open sans',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Flexible(
              child: Text(
                content,
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Open sans',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
