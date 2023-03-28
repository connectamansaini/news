import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/src/auth/bloc/auth_bloc.dart';
import 'package:news/src/auth/views/sign_up_view.dart';
import 'package:news/src/auth/views/widgets/text_field_widget.dart';
import 'package:news/src/core/domain/status.dart';
import 'package:news/src/core/presentation/widgets/spacing.dart';
import 'package:news/src/home/views/home_view.dart';
import 'package:sizer/sizer.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.signInWithEmailStatus is StatusSuccess) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute<void>(
              builder: (context) {
                return const HomeView();
              },
            ),
            (Route<dynamic> route) => false,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          centerTitle: true,
        ),
        body: Form(
          key: _loginFormKey,
          // autovalidateMode: AutovalidateMode.always,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EmailField(
                  onChanged: (String email) {
                    context.read<AuthBloc>().add(EmailChanged(email: email));
                  },
                ),
                const Spacing(size: SpacingSize.small),
                PasswordField(
                  onChanged: (String password) {
                    context
                        .read<AuthBloc>()
                        .add(PasswordChanged(password: password));
                  },
                ),
                const Spacing(size: SpacingSize.large),
                SizedBox(
                  height: 42,
                  width: 40.w,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_loginFormKey.currentState!.validate()) {
                        context
                            .read<AuthBloc>()
                            .add(SignedInWithEmailAndPassword());
                      }
                    },
                    child: const Text('Login'),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) => const SignUpView(),
                      ),
                    );
                  },
                  child: const Text("Don't have a Account, Register"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
