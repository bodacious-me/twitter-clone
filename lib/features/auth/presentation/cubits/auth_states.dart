import 'package:twitterapp/features/auth/domain/entites/user.dart';

abstract class AuthStates {}

class AuthInitial implements AuthStates{}

class AuthLoading implements AuthStates{}

class Authenticated implements AuthStates{
  final AppUser user;
  Authenticated({required this.user});
}

class UnAuthenticated implements AuthStates{}

class AuthError implements AuthStates{
  final String errorMessage;
  AuthError({required this.errorMessage});
}

