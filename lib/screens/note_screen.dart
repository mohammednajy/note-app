import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:note_app/models/note.dart';
import 'package:note_app/providers/note_provider.dart';
import 'package:note_app/utils/constant.dart';
import 'package:provider/provider.dart';
import './add_note_screen.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  late int selectedNote;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<NoteProvider>(context, listen: false).read();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // systemOverlayStyle: const SystemUiOverlayStyle(
          //     statusBarColor: themColor,
          //     ),
          backgroundColor: baseColor,
          centerTitle: true,
          title: const Text(
            'MY Notes',
          ),
        ),
        body: Consumer<NoteProvider>(builder: (context, value, child) {
          if (value.notes.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ListView.builder(
                  itemCount: value.notes.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        
                        onTap: () {
                          setState(() {
                            selectedNote = index;
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddNoteScreen(
                                        note: value.notes[index],
                                        idexOfNote: selectedNote,
                                      )));
                        },
                        minLeadingWidth: 0,
                        leading: Container(
                          width: 3,
                          height: 100,
                          color: bottomSheetColors[value.notes[index].color],
                        ),
                        title: Text(
                          value.notes[index].title,
                          style: TextStyle(
                              color: Colors.blue.shade900, fontSize: 17),
                        ),
                        subtitle: Text(
                          value.notes[index].details,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    );
                  }),
            );
          } else {
            return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.content_paste_rounded,
                    color: Color.fromARGB(255, 202, 204, 211),
                    size: 200,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'No Notes :(',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'You have no task to do.',
                    style: TextStyle(color: Colors.grey),
                  )
                ]);
          }
        }),
        floatingActionButton: FloatingActionButton(
          // to create new note
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddNoteScreen(),
            ),
          ),
          child: Container(
            height: 60,
            width: 60,
            child: Icon(
              Icons.add,
              size: 35,
            ),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [baseColor, Color.fromARGB(255, 244, 7, 244)],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void deleteNote(int index) async {
    bool _deleted =
        await Provider.of<NoteProvider>(context, listen: false).delete(index);
  }
}



