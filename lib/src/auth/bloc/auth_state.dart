part of 'auth_bloc.dart';

class AuthState {
  const AuthState({
    this.authStatus = AuthStatus.initial,
    this.signInWithEmailStatus = const StatusInitial(),
    this.createWithEmailStatus = const StatusInitial(),
    this.email = '',
    this.password = '',
  });
  final AuthStatus authStatus;
  final Status signInWithEmailStatus;
  final Status createWithEmailStatus;
  final String email;
  final String password;

  AuthState copyWith({
    AuthStatus? authStatus,
    Status? signInWithEmailStatus,
    Status? createWithEmailStatus,
    String? email,
    String? password,
  }) {
    return AuthState(
      authStatus: authStatus ?? this.authStatus,
      signInWithEmailStatus:
          signInWithEmailStatus ?? this.signInWithEmailStatus,
      createWithEmailStatus:
          createWithEmailStatus ?? this.createWithEmailStatus,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
