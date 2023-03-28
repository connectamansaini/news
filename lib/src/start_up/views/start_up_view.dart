import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/src/auth/bloc/auth_bloc.dart';
import 'package:news/src/auth/views/login_view.dart';
import 'package:news/src/core/domain/enums.dart';
import 'package:news/src/home/views/home_view.dart';
import 'package:sizer/sizer.dart';

class StartUpView extends StatelessWidget {
  const StartUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current) =>
          previous.authStatus != current.authStatus,
      listener: (context, state) {
        if (state.authStatus == AuthStatus.authenticated) {
          Navigator.pushReplacement<void, void>(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const HomeView();
              },
            ),
          );
        }
        if (state.authStatus == AuthStatus.unauthenticated) {
          Navigator.pushReplacement<void, void>(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const LoginView();
              },
            ),
          );
        }
      },
      //Scaffold is heavy material is used
      child: Material(
        child: Center(
          child: FlutterLogo(
            size: 20.w,
          ),
        ),
      ),
    );
  }
}
