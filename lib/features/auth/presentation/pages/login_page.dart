import 'package:flutter/material.dart';
import 'package:twitterapp/features/auth/presentation/componenets/forgot_password.dart';
import 'package:twitterapp/features/auth/presentation/componenets/my_textfield.dart';
import 'package:sign_button/sign_button.dart';
import 'package:twitterapp/features/auth/presentation/componenets/next_button.dart';
import 'package:twitterapp/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:twitterapp/features/auth/presentation/pages/register_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void RecoverPasswordPage() {}
  void RegisterNav() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => RegisterPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text logo
        
              Text(
                'Sign in to Y',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 70,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 50,
              ),
              // sign in with google
              SizedBox(
                width: 370,
                height: 50,
                child: SignInButton(
                    buttonType: ButtonType.google,
                    buttonSize: ButtonSize.large,
                    onPressed: () {
                      final authCubit = context.read<AuthCubit>();
                      authCubit.SignUpWithGoogle();
                    }),
              ),
              const SizedBox(
                height: 20,
              ),
              // sign in  with apple
              SizedBox(
                width: 370,
                height: 50,
                child: SignInButton(
                    buttonType: ButtonType.apple,
                    buttonSize: ButtonSize.large,
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                              'Jim Cock wants me to pay for a membership to the Apple Developer Program and since im a brokie now, we currently do not support this feature')));
                    }),
              ),
        
              const SizedBox(
                height: 10,
              ),
        
              Container(
                width: 400,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                       
                        margin: const EdgeInsets.only(right: 12.0),
                        child: Divider(
                          color: Theme.of(context).colorScheme.primary,
                          thickness: 1,
                        ),
                      ),
                    ),
                    Text(
                      'or',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 20),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 12.0),
                        child: Divider(
                          color: Theme.of(context).colorScheme.primary,
                          thickness: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
        
              const SizedBox(
                height: 10,
              ),
              // phone email or username
              const MyTextfield(
                  hintText: 'Phone, email, or username', obsecure: false),
        
              NextButton(),
              // NEXT
              const SizedBox(
                height: 10,
              ),
              // fFORGET PASSWORD
              ForgotPassword(),
        
              const SizedBox(
                height: 15,
              ),
              // not a memeber register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account?',
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                  GestureDetector(
                      onTap: RegisterNav,
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
