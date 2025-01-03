import 'package:flutter/material.dart';
import 'package:twitterapp/features/auth/presentation/pages/create_account_page.dart';

class CreateaccountButton extends StatelessWidget {
  const CreateaccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 400,
      child: ElevatedButton(
        onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateAccountPage()));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.onSurface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
            
          ),
          padding: EdgeInsets.all(20), // Padding
        ),
        child: Text(
          'Create account',
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