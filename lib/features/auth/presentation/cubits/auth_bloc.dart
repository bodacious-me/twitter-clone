import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitterapp/features/auth/domain/entites/user.dart';
import 'package:twitterapp/features/auth/domain/repository/auth_repo.dart';
import 'package:twitterapp/features/auth/presentation/cubits/auth_events.dart';
import 'package:twitterapp/features/auth/presentation/cubits/auth_states.dart';

class AuthBloc extends Bloc<AuthEvents, AuthStates> {
  final AuthRepo authRepo;
  AppUser? _currentUser;

  AuthBloc({required this.authRepo}) : super(AuthInitial()) {
    on<SignUpWithGoogleEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await authRepo.SignInWithGoogle();
        if (user != null) {
          _currentUser = user;
          emit(Authenticated(user));
        } else {
          emit(UnAuthenticated());
        }
      } catch (e) {
        emit(AuthError(errorMessage: e.toString()));
      }
    });

    on<SignUpEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        if (event.email.isNotEmpty &&
            event.name.isNotEmpty &&
            event.password.isNotEmpty &&
            event.dateOfBirth != null) {
          final user = await authRepo.SignUp(event.email, event.name,
              event.password, event.profileImageUrl, event.dateOfBirth);
          _currentUser = user;
          if (user != null && user.email.isNotEmpty) {
            emit(Authenticated(user));
          } else {
            emit(UnAuthenticated());
          }
        } else {
          emit(AuthError(errorMessage: 'Please fill out the credentials'));
        }
      } catch (e) {
        emit(AuthError(
            errorMessage:
                'Error during signup: ${e}')); // More descriptive error
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
        await authRepo.SignInWithApple(
            event.context); // await and handle the result
      } catch (e) {
        emit(AuthError(errorMessage: e.toString()));
      }
    });

    on<LogoutEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        await authRepo.Logout(); // Call logout on your repo
        emit(UnAuthenticated());
      } catch (e) {
        emit(AuthError(
            errorMessage: 'Logout error: ${e}')); // Handle logout errors
      }
    });

    on<LoginEvent>((event, emit)async {
      // emit(AuthLoading());
      // try {
      //   aw
      // } catch (e) {
      //   emit(AuthError(errorMessage: e.toString()));
      // }
    });
    add(CheckAuthEvent());
  }
  AppUser? get currentUser => _currentUser;
}
