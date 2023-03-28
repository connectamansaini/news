part of 'auth_bloc.dart';

abstract class AuthEvent {
  const AuthEvent();
}

class IsAuthenticated extends AuthEvent {}

class EmailChanged extends AuthEvent {
  EmailChanged({required this.email});
  String email;
}

class PasswordChanged extends AuthEvent {
  PasswordChanged({required this.password});
  String password;
}

class SignedInWithEmailAndPassword extends AuthEvent {}

class CreatedUserWithEmailAndPassword extends AuthEvent {}

class SignedOut extends AuthEvent {}
