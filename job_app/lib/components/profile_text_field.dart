import 'package:flutter/material.dart';
import 'package:job_app/widgets/widgets.dart';

class ProfileTextField extends StatefulWidget {
  const ProfileTextField({
    Key? key,
    required this.label,
    required this.content,
    required this.hide,
  }) : super(key: key);

  final String label;
  final String? content;
  final bool hide;

  @override
  State<ProfileTextField> createState() => _ProfileTextFieldState();
}

class _ProfileTextFieldState extends State<ProfileTextField> {

  var _controller = TextEditingController();

  @override
  void initState(){
    super.initState();
    _controller.text = widget.content!;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        text(10, TextAlign.start, false, widget.label),
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(18.0)),
            color: Colors.white,
          ),
          padding: const EdgeInsets.only(left: 12.0, right: 12.0),
          child: TextField(
            controller: _controller,
            readOnly: true,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.content,
                hintStyle: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, )),
            obscureText: widget.hide,
            autocorrect: false,
          ),
        ),
      ],
    );
  }
}