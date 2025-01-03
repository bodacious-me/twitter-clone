import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:twitterapp/features/auth/domain/entites/user.dart';
import 'package:twitterapp/features/auth/domain/repository/auth_repo.dart';
import 'package:twitterapp/features/auth/presentation/cubits/auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  final AuthRepo authRepo;
  AppUser? _currentUser;
  AuthCubit({required this.authRepo}) : super(AuthInitial());

  void SignUpWithGoogle() async {
    try {
      final user = await authRepo.SignInWithGoogle();
      if (user != null) {
        emit(Authenticated(user: user));
      }
    } catch (e) {
      emit(AuthError(errorMessage: e.toString()));
    }
  }

  void SignUpWithApple() {}

  void Login() {}

  void Signup(String email, String name, String password,
      String? profileImageUrl) async {
    try {
      final user =
          await authRepo.SignUp(email, name, password, profileImageUrl);
      if (user != null) {
        emit(Authenticated(user: user));
      }
    } catch (e) {
      emit(AuthError(
          errorMessage: 'Error in the cubit for signup method: ${e}'));
    }
  }

  void Logout() async {
    final SupabaseClient supabase = Supabase.instance.client;
    await supabase.auth.signOut();
    emit(UnAuthenticated());
  }

  void checkAuth() async {
    final AppUser? response = await authRepo.getCurrentUser();
    if (response != null) {
      emit(Authenticated(user: response));
    } else {
      emit(UnAuthenticated());
    }
  }
}
