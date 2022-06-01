import 'package:flutter/material.dart';
import 'widgets.dart';

class Buttons extends StatelessWidget {
  const Buttons({
    Key? key,
    required this.route,
    required this.textContent,
  }) : super(key: key);

  final String route;
  final String textContent;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => Navigator.of(context).pushNamed(route),
      child: text(
        16.0,
        TextAlign.center,
        true,
        textContent,
        FontWeight.w200,
      ),
      color: Colors.teal,
      textColor: Colors.white,
      padding: const EdgeInsets.only(
        top: 20.0,
        bottom: 20.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
    );
  }
}
