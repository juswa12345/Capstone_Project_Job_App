import 'package:flutter/material.dart';
import 'package:job_app/widgets/widgets.dart';

class DropDownMenu extends StatefulWidget {
  const DropDownMenu({Key? key, required this.label, required this.category, required this.icon})
      : super(key: key);

  @override
  State<DropDownMenu> createState() => _DropDownMenuState();

  final Icon icon;
  final String label;
  final List<String> category;
}

class _DropDownMenuState extends State<DropDownMenu> {
  String? currentValue;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text(18, TextAlign.start, false, widget.label, FontWeight.w700),
        Container(
          padding: const EdgeInsets.only(left: 12.0, right: 12.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Center(
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: currentValue,
                isExpanded: true,
                iconSize: 20,
                hint: Row(
                  children: [
                    widget.icon,
                    text(16,TextAlign.start, false, widget.category[0]),
                  ],
                ),
                disabledHint: Row(
                  children: [
                    widget.icon,
                    text(16,TextAlign.start, false, widget.category[0]),
                  ],
                ),
                icon: const Icon(
                  Icons.expand_more_rounded,
                ),
                items: widget.category.map(buildMenuItem).toList(),
                onChanged: (value) {
                  setState(() {
                    currentValue = value!;
                  });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: text(16, TextAlign.left, false, item),
      );
}
