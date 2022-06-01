import 'package:flutter/material.dart';
import 'package:job_app/widgets/widgets.dart';

class FilterChipButton extends StatefulWidget {
  FilterChipButton({
    Key? key,
    required this.label,
    required this.selected,
  }) : super(key: key);

  final String label;
  bool selected;

  @override
  State<FilterChipButton> createState() => _FilterChipButtonState();
}

class _FilterChipButtonState extends State<FilterChipButton> {
  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: text(14, TextAlign.center, false, widget.label),
      selected: widget.selected,
      labelStyle: TextStyle(
        color: widget.selected ? Colors.white : Colors.black,
        fontFamily: 'Poppins',
      ),
      selectedColor: Colors.teal,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: const BorderSide(color: Colors.teal, width: 1.0),
      ),
      padding: const EdgeInsets.symmetric(vertical: 11.0, horizontal: 15.0),
      onSelected: (onSelect) {
        setState(() {
          widget.selected = onSelect;
        });
      },
    );
  }
}
