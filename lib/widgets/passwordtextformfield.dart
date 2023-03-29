import 'package:flutter/material.dart';

class PasswordTextFormField extends StatelessWidget {
  final bool obserText;
  final String? Function(String?)? validator;
  final String name;
  final void Function()? onTap;
  final void Function(String)? onChanged;

  PasswordTextFormField(
      {Key? key,
      required this.name,
      required this.obserText,
      required this.validator,
      this.onChanged,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obserText,
      validator: validator,
      onChanged: onChanged,
      decoration: InputDecoration(
        fillColor: Colors.white.withOpacity(0.8),
        filled: true,
        border: OutlineInputBorder(),
        hintText: name,
        suffixIcon: GestureDetector(
          onTap: onTap,
          child: Icon(
            obserText == true ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
        ),
        hintStyle: TextStyle(color: Colors.white),
      ),
    );
  }
}
