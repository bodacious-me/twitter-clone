import 'package:flutter/material.dart';

class PostButton extends StatelessWidget {
  final VoidCallback onTap;
  const PostButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 200,
      child: ElevatedButton(
        onPressed: () {
          // Handle button press
          onTap();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
            
          ),
          padding: EdgeInsets.all(20), // Padding
        ),
        child: Text(
          'Post',
          style: TextStyle(
            color: Theme.of(context).colorScheme.surface,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
