import 'package:flutter/material.dart';
import 'package:note_app/provider/note_provider.dart';
import 'package:note_app/screens/edit_note.dart';
import 'package:note_app/screens/lunch_screen.dart';
import 'package:note_app/screens/new_note.dart';
import 'package:note_app/screens/note.dart';
import 'package:note_app/storage/db/db_provider.dart';
import 'package:provider/provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DbProvider().initDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NoteProvider>(create: (_) => NoteProvider()),
      ],
      child:const MyMaterialApp(),
    );
  }
}

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
          debugShowCheckedModeBanner: false,
        initialRoute: '/Lunch_Screen',
        routes: {
          '/Lunch_Screen' : (context) => const LunchScreen(),
          '/Note_Screen' : (context) => const NoteApp(),
         // '/Edit_Note' : (context) => const EditNote(),
          '/New_Note' : (context) => const NewNote(),
        },
      );
  }
}