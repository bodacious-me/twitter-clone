import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 400,
      child: ElevatedButton(
        onPressed: () {
          // Handle button press
          print('Button pressed!');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.onSurface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
            
          ),
          padding: EdgeInsets.all(20), // Padding
        ),
        child: Text(
          'Next',
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
