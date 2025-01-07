import 'package:flutter/material.dart';

class MyTextfield extends StatefulWidget {
  final bool obsecure;
  final String hintText;
  final TextEditingController controller;
  final FocusNode focusNode;
  const MyTextfield(
      {super.key,
      required this.hintText,
      required this.obsecure,
      required this.controller,
      required this.focusNode});

  @override
  State<MyTextfield> createState() => _MyTextfieldState();
}

class _MyTextfieldState extends State<MyTextfield> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: TextField(
        focusNode: widget.focusNode,
        controller: widget.controller,
        obscureText: widget.obsecure,
        decoration: InputDecoration(
          labelText: widget.hintText,
          labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
          floatingLabelStyle: TextStyle(
            color: Colors.blue,
            fontSize: 18,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.primary),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.secondary)),
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
          contentPadding: EdgeInsets.symmetric(
            vertical: 25.0,
            horizontal: 10.0,
          ),
        ),
      ),
    );
  }
}
