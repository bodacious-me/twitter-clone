import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitterapp/features/auth/domain/entites/user.dart';
import 'package:twitterapp/features/auth/domain/repository/auth_repo.dart';
import 'package:twitterapp/features/auth/presentation/bloc/auth_events.dart';
import 'package:twitterapp/features/auth/presentation/bloc/auth_states.dart';

class AuthBloc extends Bloc<AuthEvents, AuthStates> {
  final AuthRepo authRepo;

  AuthBloc({required this.authRepo}) : super(AuthInitial()) {
    on<SignUpWithGoogleEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final currentUser = await authRepo.SignInWithGoogle();
        if (currentUser != null) {
          emit(Authenticated(currentUser));
        } else {
          emit(UnAuthenticated());
        }
      } catch (e) {
        emit(AuthError(errorMessage: e.toString()));
      }
    });

    on<SignUpEvent>((event, emit) async {
      if (event.email.isNotEmpty &&
          event.name.isNotEmpty &&
          event.password.isNotEmpty &&
          event.dateOfBirth != null) {
        try {
          emit(AuthLoading());

          await authRepo.SignUp(event.email, event.name, event.password,
              event.profileImageUrl, event.dateOfBirth);
          final currentUser = await authRepo.getCurrentUser();
          print('here : ${currentUser!.email}');
          emit(Authenticated(AppUser(
              dateOfBirth: event.dateOfBirth,
              email: event.email,
              username: event.name,
              profileImageUrl: event.profileImageUrl)));

          //emit(AuthLoading());
        } catch (e) {
          emit(AuthError(errorMessage: 'Error during signup: ${e}'));
        }
      } else {
        emit(AuthError(errorMessage: 'Please provide the credentials'));
      }
    });

    on<CheckAuthEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final AppUser? user = await authRepo.getCurrentUser();
        if (user != null) {
          emit(Authenticated(user));
        } else {
          emit(UnAuthenticated());
        }
      } catch (e) {
        emit(AuthError(errorMessage: e.toString()));
      }
    });

    on<SignUpWithAppleEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        await authRepo.SignInWithApple(event.context);
      } catch (e) {
        emit(AuthError(errorMessage: e.toString()));
      }
    });

    on<LogoutEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        await authRepo.Logout();
        emit(UnAuthenticated());
      } catch (e) {
        emit(AuthError(errorMessage: 'Logout error: ${e}'));
      }
    });

    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await authRepo.LogIn(event.email, event.password);
        final logedInUser = await authRepo.getCurrentUser();
        if (logedInUser != null) {
          emit(Authenticated(logedInUser));
        } else {
          emit(AuthError(errorMessage: 'Something went wrong'));
        }
      } catch (e) {
        emit(AuthError(errorMessage: e.toString()));
      }
    });

    on<ResetPasswordEvent>((event, emit) async {
      emit(AuthLoading());
      // try {
      //   await authRepo.resetPassword(event.email);
      // } catch (e) {
      //   emit(AuthError(errorMessage: e.toString()));
      // }
      emit(AuthError(errorMessage: 'I could not afford a SMTP service so you should get yourself another account LOL'));
    });

    add(CheckAuthEvent());
  }
}
