import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDatePiicker extends StatefulWidget {
  const MyDatePiicker({super.key});

  @override
  State<MyDatePiicker> createState() => _MyDatePiickerState();
}

class _MyDatePiickerState extends State<MyDatePiicker> {
  DateTime dateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: CupertinoDatePicker(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        onDateTimeChanged: (dateTime) => setState(() => this.dateTime = dateTime),
        mode: CupertinoDatePickerMode.date,
        initialDateTime: dateTime,
        
      ),
    );
  }
}
