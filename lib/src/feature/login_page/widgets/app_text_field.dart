import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    required this.labelText,
    required this.onChanged,
    this.icon,
    this.maxCharacters,
    this.hideCharacters = false,
    this.useValidator,
    this.keyboardType,
    super.key,
  });

  final String labelText;
  final void Function(String)? onChanged;
  final Widget? icon;
  final int? maxCharacters;
  final bool hideCharacters;
  final bool? useValidator;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (useValidator ?? false) ? formValidator : null,
      keyboardType: keyboardType,
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

  String? formValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }
}
