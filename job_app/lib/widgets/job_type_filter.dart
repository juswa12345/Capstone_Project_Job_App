import 'package:flutter/material.dart';
import 'package:job_app/widgets/widgets.dart';

class JobTypeFilters extends StatefulWidget {
  const JobTypeFilters({Key? key}) : super(key: key);

  @override
  State<JobTypeFilters> createState() => _JobTypeFiltersState();
}

class _JobTypeFiltersState extends State<JobTypeFilters> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return  Wrap(
      spacing: 5.0,
      runSpacing: 5.0,
      children: [
        FilterChipButton(label: 'Full Time', selected: selected,),
        FilterChipButton(label: 'Part Time', selected: selected,),
        FilterChipButton(label: 'Contract', selected: selected,),
        FilterChipButton(label: 'Freelance', selected: selected,),
        FilterChipButton(label: 'Remote', selected: selected,),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: TextButton(
            onPressed: (){
              setState(() {
                selected = !selected;
              });
            },
            child: text(14, TextAlign.center, false, 'Show All Types'),
          ),
        )
      ],
    );
  }
}
