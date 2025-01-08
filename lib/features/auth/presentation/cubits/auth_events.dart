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

class LoginEvent extends AuthEvents {}

class SignUpWithGoogleEvent extends AuthEvents {}

class SignUpWithAppleEvent extends AuthEvents {
  final BuildContext context;

  SignUpWithAppleEvent(this.context);
}

class LogoutEvent extends AuthEvents {}

class CheckAuthEvent extends AuthEvents{}