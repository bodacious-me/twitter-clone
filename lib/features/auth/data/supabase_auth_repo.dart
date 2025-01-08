import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:twitterapp/features/auth/domain/entites/user.dart';
import 'package:twitterapp/features/auth/domain/repository/auth_repo.dart';

class SupabaseAuthRepo implements AuthRepo {
  final _supabase = Supabase.instance.client;
  @override
  Future<AppUser?> SignInWithGoogle() async {
    final GoogleSignIn _googleSignIn = await GoogleSignIn(
        clientId:
            "214111205377-hc7r1r3hc7aci04ladmplhc068ealu47.apps.googleusercontent.com");
    try {
      final response = await Supabase.instance.client.auth
          .signInWithOAuth(OAuthProvider.google);
    } catch (error) {
      print('Error during Google Sign-In: $error');
    }
    return null;
  }

  @override
  Future<void> SignInWithApple(BuildContext context) {
ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                              'Jim Cock wants me to pay for a membership to the Apple Developer Program and since im a brokie now, we currently do not support this feature')));
    throw UnimplementedError();
  }

  @override
  Future<AppUser?> LogIn(String email, String password) {
    // TODO: implement LogIn
    throw UnimplementedError();
  }

  @override
  Future<AppUser?> SignUp(String email, String username, String password,
      String? profileImageUrl, String? dateOfBirth) async {
    try {
      await _supabase.auth.signUp(password: password, email: email);
      final currentUser = _supabase.auth.currentUser;
      print(currentUser!.email);
      if (currentUser.email!.isNotEmpty) {
        return AppUser(
            email: email,
            profileImageUrl: profileImageUrl ?? '',
            username: username,
            dateOfBirth: dateOfBirth);
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('Error Signing in with Email: ${e}');
    }
  }

  @override
  Future<void> Logout() async {
    try {
      await Supabase.instance.client.auth.signOut();
    } catch (e) {
      throw Exception('Error logging out ${e}');
    }
  }

  @override
  Future<AppUser?> getCurrentUser() async {
    try {
      final user = Supabase.instance.client.auth.currentUser;
      if (user != null) {
        AppUser returnUser = AppUser(
            dateOfBirth: 'adzio',
            email: user.email ?? 'hamawmin',
            profileImageUrl: '',
            username: 'adad');
        return returnUser;
      }
      // } else {
      //   return null;
      // }
    } catch (e) {
      throw Exception('Cannot get user ${e}');
    }
  }
}
