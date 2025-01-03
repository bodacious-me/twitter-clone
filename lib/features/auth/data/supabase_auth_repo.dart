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
  Future<AppUser?> SignInWithApple() {
    // TODO: implement SignInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<AppUser?> LogIn(String email, String password) {
    // TODO: implement LogIn
    throw UnimplementedError();
  }

  @override
  Future<AppUser?> SignUp(String email, String username, String password, String? profileImageUrl) async {
    try {
      final response =
          await _supabase.auth.signUp(password: password, email: email);
      final currentUser = await _supabase.auth.currentUser;
      if (currentUser != null) {
        return AppUser(email: email, profileImageUrl: profileImageUrl ?? '', username: username);
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('Error Signing in with Email: ${e}');
    }
  }

  @override
  Future<void> Logout() {
    // TODO: implement Logout
    throw UnimplementedError();
  }

  @override
  Future<AppUser?> getCurrentUser() async {
    try {
      final user = Supabase.instance.client.auth.currentUser;
      if (user != null) {
        AppUser returnUser = AppUser(
            email: user.userMetadata!['email'],
            profileImageUrl: user.userMetadata!['avatar_url'],
            username: user.userMetadata!['full_name']);
        return returnUser;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('Cannot get user ${e}');
    }
  }
}
