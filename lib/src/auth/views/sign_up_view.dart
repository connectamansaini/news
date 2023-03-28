import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/src/auth/bloc/auth_bloc.dart';
import 'package:news/src/auth/views/widgets/text_field_widget.dart';
import 'package:news/src/core/domain/status.dart';
import 'package:news/src/core/presentation/widgets/spacing.dart';
import 'package:news/src/home/views/home_view.dart';
import 'package:sizer/sizer.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _signUpFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.createWithEmailStatus is StatusSuccess) {
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
          title: const Text('Register'),
          centerTitle: true,
        ),
        body: Form(
          key: _signUpFormKey,
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
                const Spacing(size: SpacingSize.regular),
                const Spacing(size: SpacingSize.regular),
                SizedBox(
                  height: 42,
                  width: 40.w,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_signUpFormKey.currentState!.validate()) {
                        context
                            .read<AuthBloc>()
                            .add(CreatedUserWithEmailAndPassword());
                      }
                    },
                    child: const Text('Register'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
