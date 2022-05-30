import 'package:flutter/material.dart';
import 'package:note_app/providers/note_provider.dart';
import 'package:note_app/utils/constant.dart';
import 'package:note_app/widgets/bottom_sheet_button.dart';
import 'package:provider/provider.dart';
import '../models/note.dart';
import '../widgets/ColorSlider.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({Key? key, this.note, this.idexOfNote = 0})
      : super(key: key);
  final Note? note;
  final int idexOfNote;
  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  static Color themColor = baseColor;
  late TextEditingController _titelTextEditingController;
  late TextEditingController _detailsTextEditingController;
  int selectedColor = 0;
  @override
  void initState() {
    super.initState();
    _titelTextEditingController = TextEditingController(
      text: widget.note?.title,
    );
    _detailsTextEditingController =
        TextEditingController(text: widget.note?.details);
  }

  @override
  void dispose() {
    _titelTextEditingController.dispose();
    _detailsTextEditingController.dispose();
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Note'),
          backgroundColor: themColor,
          titleSpacing: 0,
          actions: [
            IconButton(
              onPressed: () {
                bottomSheet(context);
              },
              icon: const Icon(Icons.more_vert),
              padding: EdgeInsetsDirectional.zero,
            ),
            IconButton(
              onPressed: () async {
                await finalSave();
              },
              icon: const Icon(
                Icons.check,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(children: [
            TextField(
              keyboardType: TextInputType.text,
              controller: _titelTextEditingController,
              decoration: InputDecoration(
                  hintText: 'Type Something....',
                  hintStyle: TextStyle(color: themColor),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: themColor))),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _detailsTextEditingController,
              keyboardType: TextInputType.text,
              maxLines: 4,
              minLines: 4,
              decoration: const InputDecoration(
                  hintText: 'Type Something....',
                  border: UnderlineInputBorder(borderSide: BorderSide.none)),
            ),
          ]),
        ),
      ),
    );
  }

  void bottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 250,
          color: themColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                BottomSheetButton(
                    icon: Icons.share,
                    text: 'Share with your friends',
                    onPressed: () {
                      print('share');
                    }),
                BottomSheetButton(
                    icon: Icons.delete,
                    text: 'Delete',
                    onPressed: () {
                      deleteNote(widget.idexOfNote);
                      clear();
                    }),
                BottomSheetButton(
                    icon: Icons.content_copy,
                    text: 'Dublicate',
                    onPressed: () {
                      dublicateNote(widget.idexOfNote);
                    }),
                Container(
                  height: 80,
                  child: MyColorPicker(
                      onSelectColor: (value, index) {
                        setState(() {
                          themColor = value;
                          selectedColor = index;
                        });
                      },
                      availableColors: bottomSheetColors,
                      initialColor: Colors.blue),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> finalSave() async {
    if (checkData()) {
      await save();
    }
  }

  bool checkData() {
    if (_titelTextEditingController.text.isNotEmpty &&
        _detailsTextEditingController.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  Future<void> save() async {
    bool saved = widget.note == null
        ? await Provider.of<NoteProvider>(context, listen: false)
            .create(note: note)
        : await Provider.of<NoteProvider>(context, listen: false).update(note);
    widget.note != null ? Navigator.pop(context) : clear();
  }

  Note get note {
    Note note = Note();
    if (widget.note != null) {
      note.id = widget.note!.id;
    }
    note.title = _titelTextEditingController.text;
    note.details = _detailsTextEditingController.text;
    note.color = selectedColor;
    return note;
  }

  void clear() {
    _titelTextEditingController.text = '';
    _detailsTextEditingController.text = '';
  }

  void deleteNote(int index) async {
    bool _deleted =
        await Provider.of<NoteProvider>(context, listen: false).delete(index);
  }

  void dublicateNote(int index) async {
    await Provider.of<NoteProvider>(context, listen: false).create(note: note);
  }
}
