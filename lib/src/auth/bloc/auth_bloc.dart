import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:news/src/auth/repository/auth_repository.dart';
import 'package:news/src/core/domain/enums.dart';
import 'package:news/src/core/domain/status.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this.authRepository) : super(const AuthState()) {
    on<IsAuthenticated>(_onIsAuthenticated);
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<SignedInWithEmailAndPassword>(_onSignedInWithEmailAndPassword);
    on<CreatedUserWithEmailAndPassword>(_onCreatedUserWithEmailAndPassword);
    on<SignedOut>(_onSignedOut);
  }
  final AuthRepository authRepository;

  Future<void> _onIsAuthenticated(
    IsAuthenticated event,
    Emitter<AuthState> emit,
  ) async {
    final currentUser = authRepository.currentUser;
    if (currentUser != null) {
      await Future<void>.delayed(const Duration(milliseconds: 300));
      emit(
        state.copyWith(authStatus: AuthStatus.authenticated),
      );
    } else {
      await Future<void>.delayed(const Duration(milliseconds: 300));
      emit(state.copyWith(authStatus: AuthStatus.unauthenticated));
    }
  }

  void _onEmailChanged(EmailChanged event, Emitter<AuthState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<AuthState> emit) {
    emit(state.copyWith(password: event.password));
  }

  Future<void> _onSignedInWithEmailAndPassword(
    SignedInWithEmailAndPassword event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(state.copyWith(signInWithEmailStatus: Status.loading()));

      // final user =
      await authRepository.signInWithEmailAndPassword(
        email: state.email,
        password: state.password,
      );

      emit(
        state.copyWith(
          signInWithEmailStatus: Status.success(),
          authStatus: AuthStatus.authenticated,
        ),
      );
    } on Failure catch (f) {
      emit(state.copyWith(signInWithEmailStatus: Status.failure(f)));
    }
  }

  Future<void> _onCreatedUserWithEmailAndPassword(
    CreatedUserWithEmailAndPassword event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(state.copyWith(createWithEmailStatus: Status.loading()));
      // final user =
      await authRepository.createUserWithEmailAndPassword(
        email: state.email,
        password: state.password,
      );

      emit(
        state.copyWith(
          createWithEmailStatus: Status.success(),
          authStatus: AuthStatus.authenticated,
        ),
      );
    } on Failure catch (f) {
      emit(state.copyWith(createWithEmailStatus: Status.failure(f)));
    }
  }

  Future<void> _onSignedOut(SignedOut event, Emitter<AuthState> emit) async {
    try {
      await authRepository.signOut();
      emit(
        state.copyWith(
          authStatus: AuthStatus.unauthenticated,
          signInWithEmailStatus: Status.initial(),
          createWithEmailStatus: Status.initial(),
        ),
      );
    } catch (e) {
      emit(state.copyWith(authStatus: AuthStatus.authenticated));
    }
  }
}
