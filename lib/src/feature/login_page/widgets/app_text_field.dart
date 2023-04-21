import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    required this.labelText,
    required this.onChanged,
    this.icon,
    this.maxCharacters,
    this.hideCharacters = false,
    super.key,
  });

  final String labelText;
  final void Function(String)? onChanged;
  final Widget? icon;
  final int? maxCharacters;
  final bool hideCharacters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      maxLength: maxCharacters,
      obscureText: hideCharacters,
      autocorrect: false,
      decoration: InputDecoration(
        labelText: labelText,
        suffixIcon: icon,
      ),
    );
  }
}
