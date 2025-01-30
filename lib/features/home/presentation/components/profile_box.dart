import 'package:flutter/material.dart';

class ProfileBox extends StatefulWidget {
  final String? imageUrl;
  final String username;
  ProfileBox({super.key, required this.imageUrl, required this.username});

  @override
  State<ProfileBox> createState() => _ProfileBoxState();
}

class _ProfileBoxState extends State<ProfileBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(widget.imageUrl ?? 'https://newprofilepic.photo-cdn.net//assets/images/article/profile.jpg?90af0c8'),
              ),
            ),
            Text(
              widget.username,
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
