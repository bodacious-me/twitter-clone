import 'package:flutter/material.dart';
import 'package:sign_button/sign_button.dart';
import 'package:twitterapp/features/auth/presentation/componenets/createAccount_button.dart';
import 'package:twitterapp/features/auth/presentation/cubits/auth_bloc.dart';
import 'package:twitterapp/features/auth/presentation/cubits/auth_events.dart';
import 'package:twitterapp/features/auth/presentation/pages/login_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  void LoginNav() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    void SignUpWithGoogle() {
      print('called the methid in the regiuster page');
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text logo
          
              Text(
                'Join Y today',
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
                    btnText: 'Sign up with google',
                    buttonType: ButtonType.google,
                    buttonSize: ButtonSize.large,
                    onPressed: () {
                      final authCubit = context.read<AuthBloc>().add(SignUpWithGoogleEvent());
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
                    btnText: 'Sign up with apple',
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
          
              CreateaccountButton(),
              // NEXT
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 15,
              ),
              // not a memeber register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Have an account already?',
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                  GestureDetector(
                      onTap: LoginNav,
                      child: Text(
                        'Log in',
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
