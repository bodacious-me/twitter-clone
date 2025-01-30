import 'package:flutter/material.dart';

class createPostField extends StatefulWidget {
  final VoidCallback onTap;
   bool showPopUp;
  final TextEditingController controller;
   createPostField(
      {super.key, required this.onTap, required this.controller, required this.showPopUp});

  @override
  State<createPostField> createState() => _createPostFieldState();
}

class _createPostFieldState extends State<createPostField> {

  bool get showUpValue{
    return widget.showPopUp;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xFF262D34),
        ),
        height: 80,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://newprofilepic.photo-cdn.net//assets/images/article/profile.jpg?90af0c8'),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  child: TextField(
                    controller: widget.controller,
                    decoration: InputDecoration(
                      fillColor: Color(0xFF2C353D),
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none),
                      hintText: 'Share what\'s on your mind ...',
                      hintStyle: TextStyle(color: Color(0xFF858EAD)),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: GestureDetector(
                onTap: () {
                  if (widget.controller.text.isNotEmpty && widget.showPopUp) {
                    // widget.onTap();

                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please Type in Something ')));
                  }
                  widget.controller.text = '';
                },
                child: Container(
                  height: 50,
                  width: 100,
                  child: Center(
                      child: Text(
                    'Create Post',
                    style: TextStyle(),
                  )),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFFFF571A),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
