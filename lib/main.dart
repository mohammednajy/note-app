import 'package:flutter/material.dart';
import 'package:note_app/database/db_controller.dart';
import 'package:note_app/providers/note_provider.dart';
import 'package:note_app/screens/note_screen.dart';
import 'package:note_app/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbController().initDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NoteProvider>(
            create: (context) => NoteProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/splash_screen',
        routes: {
          '/splash_screen': (context) => const SplashScreen(),
          '/note_screen': (context) => const NoteScreen(),
        },
      ),
    );
  }
}
