import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    required this.hintText,
    required this.prefixIcon,
  }) : super(key: key);

  final Icon prefixIcon;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(18.0)),
          color: Colors.white,
        ),
        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: prefixIcon,
            hintText: hintText,
          ),
        ),
      ),
    );
  }
}

class PasswordTextField extends StatefulWidget {

  const PasswordTextField({
    Key? key,
    required this.hintText,
    required this.prefixIcon,
  }) : super(key: key);

  final Icon prefixIcon;
  final String hintText;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {

  bool obscureController = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(18.0)),
          color: Colors.white,
        ),
        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: widget.prefixIcon,
            hintText: widget.hintText,
          ),
          obscureText: obscureController,
          autocorrect: false,
        ),
      ),
    );
  }
}

