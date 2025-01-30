import 'package:flutter/material.dart';
import 'package:twitterapp/features/auth/presentation/componenets/my_textfield.dart';
import 'package:twitterapp/features/auth/presentation/componenets/send_link_button.dart';
import 'package:twitterapp/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:twitterapp/features/auth/presentation/bloc/auth_events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController email_controller = TextEditingController();
  FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Reset Your Password here',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
           const  SizedBox(
              height: 30,
            ),
            MyTextfield(
                hintText: 'Enter an Email',
                obsecure: false,
                controller: email_controller,
                focusNode: focusNode),
            SendLinkButton(
              onTap: ()async{
                context.read<AuthBloc>().add(ResetPasswordEvent(email_controller.text));
              },
            ),
          ],
        ),
      ),
    );
  }
}
