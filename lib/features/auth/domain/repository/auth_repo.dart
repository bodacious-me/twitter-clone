import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:twitterapp/features/auth/domain/entites/user.dart';

abstract class AuthRepo {
  Future<AppUser?> SignInWithGoogle();
  Future<AppUser?> SignInWithApple();
  Future<AppUser?> SignUp(String email, String name,String password,String? profileImageUrl, String? dateOfBirth);
  Future<AppUser?> LogIn(String email, String password);
  Future<void> Logout();
  Future<AppUser?> getCurrentUser();
}
