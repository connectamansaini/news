import 'package:flutter/material.dart';
import 'package:news/src/core/domain/validator.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    required this.onChanged,
    super.key,
  });

  final void Function(String email)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validateEmail,
      keyboardType: TextInputType.emailAddress,
      onChanged: onChanged,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        label: Text('Email'),
        prefixIcon: Icon(Icons.email),
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  const PasswordField({
    required this.onChanged,
    super.key,
  });
  final void Function(String password)? onChanged;
  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  var _visiblePassword = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: !_visiblePassword,
      validator: validatePassword,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        label: const Text('Password'),
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _visiblePassword = !_visiblePassword;
            });
          },
          icon: Icon(
            _visiblePassword ? Icons.visibility_off : Icons.visibility,
          ),
        ),
      ),
    );
  }
}
