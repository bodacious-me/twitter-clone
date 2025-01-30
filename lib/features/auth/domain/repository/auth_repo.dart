import 'package:flutter/widgets.dart';
import 'package:twitterapp/features/auth/domain/entites/user.dart';

abstract class AuthRepo {
  Future<AppUser?> SignInWithGoogle();
  Future<void> SignInWithApple(BuildContext context);
  Future<AppUser?> SignUp(String email, String name, String password,
      String? profileImageUrl, String? dateOfBirth);
  Future<void> LogIn(String email, String password);
  Future<void> Logout();
  Future<AppUser?> getCurrentUser();
  Future<void> resetPassword(String email);
}
