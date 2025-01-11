import 'package:flutter/material.dart';
import 'package:twitterapp/features/auth/presentation/pages/login_page.dart';

class SendLinkButton extends StatefulWidget {
  final VoidCallback onTap;
  const SendLinkButton({super.key, required this.onTap});

  @override
  State<SendLinkButton> createState() => _SendLinkButtonState();
}

class _SendLinkButtonState extends State<SendLinkButton> {
  @override
  Widget build(BuildContext context) {
        return SizedBox(
      height: 50,
      width: 400,
      child: ElevatedButton(
        onPressed: () async{
          widget.onTap();
          
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.onSurface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
            
          ),
          padding: EdgeInsets.all(20), // Padding
        ),
        child: Text(
          'Send Link',
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