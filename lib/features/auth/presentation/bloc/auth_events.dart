import 'package:flutter/widgets.dart';

abstract class AuthEvents {}

class SignUpEvent extends AuthEvents {
  String email;
  String name;
  String password;
  String? profileImageUrl;
  String? dateOfBirth;
  SignUpEvent(this.email, this.dateOfBirth, this.name, this.password,
      this.profileImageUrl);
}

class LoginEvent extends AuthEvents {
  final String email;
  final String password;
  LoginEvent(this.email, this.password);
}

class SignUpWithGoogleEvent extends AuthEvents {}

class SignUpWithAppleEvent extends AuthEvents {
  final BuildContext context;

  SignUpWithAppleEvent(this.context);
}

class LogoutEvent extends AuthEvents {}

class CheckAuthEvent extends AuthEvents{}

class ResetPasswordEvent extends AuthEvents{
  final String email;
  ResetPasswordEvent(this.email);
}