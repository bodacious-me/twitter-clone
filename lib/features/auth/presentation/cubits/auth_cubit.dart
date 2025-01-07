import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:twitterapp/features/auth/domain/entites/user.dart';
import 'package:twitterapp/features/auth/domain/repository/auth_repo.dart';
import 'package:twitterapp/features/auth/presentation/cubits/auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  final AuthRepo authRepo;
  AppUser? _currentUser;
  AuthCubit({required this.authRepo}) : super(AuthInitial());
  AppUser? get currentUser => _currentUser;

  void SignUpWithGoogle() async {
    emit(AuthLoading());
    try {
      final user = await authRepo.SignInWithGoogle();
      if (user != null) {
        emit(Authenticated(user));
      }
    } catch (e) {
      emit(AuthError(errorMessage: e.toString()));
    }
  }

  void SignUpWithApple() {}

  void Login() {}
  void Signup(String email, String name, String password,
      String? profileImageUrl, String? dateOfBirth) async {
    emit(AuthLoading());
    try {
      if (email.isNotEmpty && password.isNotEmpty && dateOfBirth != null) {
        final user = await authRepo.SignUp(
            email, name, password, profileImageUrl, dateOfBirth);
        _currentUser = user;
        if (user!.email.isNotEmpty) {
          emit(Authenticated(user));
        } else {
          emit(UnAuthenticated());
        }
      } else {
        emit(AuthError(errorMessage: 'Please fill out the credentials'));
      }
    } catch (e) {
      emit(AuthError(
          errorMessage: 'Error in the cubit for signup method: ${e}'));
    }
  }

  void Logout() async {
    try {
      emit(AuthLoading());
      final SupabaseClient supabase = Supabase.instance.client;
      await supabase.auth.signOut();
    } catch (e) {}
    emit(UnAuthenticated());
  }

  void checkAuth() async {
    emit(AuthLoading());
    try {
      final AppUser? user = await authRepo.getCurrentUser();
      if (user != null) {
        _currentUser = user;
        emit(Authenticated(user));
      } else {
        emit(UnAuthenticated());
      }
    } catch (e) {
      emit(AuthError(errorMessage: e.toString()));
    }
  }
}
