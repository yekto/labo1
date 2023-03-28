import 'package:flutter/material.dart';
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
RegExp regExp = new RegExp(p);

class MyTextFormField extends StatelessWidget {
  final String? Function(String?)? validator;
  final String name;
  final TextInputType? keyboardType;

  MyTextFormField(
      {Key? key,
      required this.name,
      required this.validator, this.keyboardType
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        fillColor: Colors.white.withOpacity(0.8),
        filled: true,
        border: OutlineInputBorder(),
        hintText: name,
        hintStyle: TextStyle(color: Colors.white),
      ),
    );
  }
}
