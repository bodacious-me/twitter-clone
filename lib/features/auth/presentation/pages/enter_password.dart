import 'package:flutter/material.dart';
import 'package:twitterapp/features/auth/presentation/componenets/login_button.dart';
import 'package:twitterapp/features/auth/presentation/componenets/my_textfield.dart';
import 'package:twitterapp/features/auth/presentation/cubits/auth_bloc.dart';
import 'package:twitterapp/features/auth/presentation/cubits/auth_events.dart';
import 'package:twitterapp/features/auth/presentation/pages/login_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EnterPasswordPage extends StatefulWidget {
  String email_username;
  EnterPasswordPage({super.key, required this.email_username});

  @override
  State<EnterPasswordPage> createState() => _EnterPasswordPageState();
}

class _EnterPasswordPageState extends State<EnterPasswordPage> {
  void login() {
    try {
      final authBloc = context
          .read<AuthBloc>()
          .add(LoginEvent(widget.email_username, password_controller.text));
    } catch (e) {
      throw Exception('Error with the Login button: ${e.toString()}');
    }
  }

  FocusNode focusNode = FocusNode();
  TextEditingController password_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter Your Password',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface, fontSize: 40),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.topLeft,
              height: 90,
              width: 400,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Align children to the left
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 9, left: 10), // Padding on top and right
                    child: Text(
                      'Email',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 9, left: 10), // Padding on top and right
                    child: Text(
                      widget.email_username,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            MyTextfield(
                hintText: 'Password',
                obsecure: true,
                controller: password_controller,
                focusNode: focusNode),
            LoginButton(
              onTap: () {
                print('called the login button');
                if (password_controller.text.isNotEmpty) {
                  login();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please Enter the Password')));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
