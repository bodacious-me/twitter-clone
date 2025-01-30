import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370,
      child: TextField(
        decoration: InputDecoration(
          fillColor: Color(0xFF2C353D),
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none),
          hintText: 'Type here to search ...',
          suffixIcon: Icon(
            Icons.search_rounded,
            color: Color(0xFF858EAD),
          ),
          hintStyle: TextStyle(color: Color(0xFF858EAD)),
        ),
      ),
    );
  }
}
