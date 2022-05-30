import 'package:flutter/material.dart';

class BottomSheetButton extends StatelessWidget {
  BottomSheetButton(
      {required this.icon,
      required this.text,
      required this.onPressed,
      Key? key})
      : super(key: key);
  final IconData icon;
  final String text;
  VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.white,
        ),
        title: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
