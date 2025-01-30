import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:twitterapp/features/auth/domain/entites/user.dart';
import 'package:twitterapp/features/auth/domain/repository/auth_repo.dart';

class SupabaseAuthRepo implements AuthRepo {
  final _supabase = Supabase.instance.client;
  final _databse = Supabase.instance.client.from('users');
  @override
  Future<AppUser?> SignInWithGoogle() async {
    final GoogleSignIn _googleSignIn = await GoogleSignIn(
        clientId:
            "214111205377-hc7r1r3hc7aci04ladmplhc068ealu47.apps.googleusercontent.com");
    try {
      await Supabase.instance.client.auth.signInWithOAuth(OAuthProvider.google);
      final currentUser = await _supabase.auth.currentUser;
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
  Future<void> LogIn(String email, String password) async {
    try {
      await _supabase.auth.signInWithPassword(password: password, email: email);
    } catch (e) {
      throw Exception('Error Logging User in : ${e.toString()}');
    } 
  }

  @override
  Future<AppUser?> SignUp(String email, String username, String password,
      String? profileImageUrl, String? dateOfBirth) async {
    try {
      await _supabase.auth.signUp(password: password, email: email);
      await _databse.insert({
        'username': username,
        'email': email,
        'profile_Image_url': profileImageUrl,
        'date_of_birth': dateOfBirth
      });
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
      final currentUser = _supabase.auth.currentUser;
    // final userEmail = 'test1@gmail.com';
      if (currentUser != null) {
        final userEmail = _supabase.auth.currentUser!.email;
        final user = await _supabase
            .from('users')
            .select()
            .eq('email', userEmail!)
            .single();

        AppUser returnUser = AppUser(
            dateOfBirth: user['dateOfBirth'],
            email: user['email'],
            profileImageUrl: user['profileImageUrl'],
            username: user['username']);
        return returnUser;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('Cannot get user ${e}');
    }
  }

  @override
  Future<void> resetPassword(String email) async {
    try {
      await _supabase.auth.resetPasswordForEmail(email);
    } catch (e) {
      throw Exception('Error Reseting password:${e.toString()}');
    }
  }
}
