import 'package:flutter/material.dart';

class HomeButton extends StatefulWidget {
  const HomeButton({super.key});

  @override
  State<HomeButton> createState() => _HomeButtonState();
}

class _HomeButtonState extends State<HomeButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        print('Home Clicked');
      },
      child: Icon(
        Icons.home_filled,
        color: Colors.white,
      ),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(55, 55),
        backgroundColor: Color(0xFFFF571A),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
    );
  }
}
