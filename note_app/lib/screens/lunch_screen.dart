import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/note_provider.dart';

class LunchScreen extends StatefulWidget {
  const LunchScreen({Key? key}) : super(key: key);

  @override
  _LunchScreenState createState() => _LunchScreenState();
}

class _LunchScreenState extends State<LunchScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/Note_Screen');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 28, 44, 180),
              Color.fromARGB(255, 104, 12, 128),
            ],
          ),
        ),
        child: const Text(
          'Note App',
          style: TextStyle(
            fontFamily: 'Cairo',
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
