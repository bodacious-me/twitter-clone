import 'package:flutter/material.dart';

class BoxContainers extends StatefulWidget {
  final bool selected;
  final String IconUrl;
  final String boldText;
  final String text;
  const BoxContainers(
      {super.key,
      required this.selected,
      required this.IconUrl,
      required this.boldText,
      required this.text});

  @override
  State<BoxContainers> createState() => _BoxContainersState();
}

class _BoxContainersState extends State<BoxContainers> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: widget.selected ? Color(0xFF2C353D) : Color(0xFF262D34),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFF2C353D),
                  image: DecorationImage(
                    image: NetworkImage(widget.IconUrl),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.rectangle),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0, top: 5),
                  child: Text(
                    widget.boldText,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                Text(
                  widget.text,
                  style: TextStyle(color: Color(0xFF97989D), fontSize: 15),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
