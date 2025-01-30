import 'package:flutter/material.dart';
import 'package:twitterapp/features/post/domain/entites/post.dart';

class PostsColumn extends StatefulWidget {
  List<Post> posts;
  PostsColumn({super.key, required this.posts});

  @override
  State<PostsColumn> createState() => _PostsColumnState();
}

class _PostsColumnState extends State<PostsColumn> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.posts.length,
        itemBuilder: (context, index) {
          final post = widget.posts[index];
          return Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xFF262D34),
            ),
            margin: EdgeInsets.all(8.0),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.header,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(post.timestamp),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
