import 'package:flutter/material.dart';
import 'package:note_app/utils/constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/note_screen');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Image.asset(
            'images/splash.PNG',
          )),
          ElevatedButton(
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, '/note_screen'),
              child: const Text(
                'Get Started',
                style: TextStyle(fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                  primary: baseColor, fixedSize: const Size(200, 50))),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
