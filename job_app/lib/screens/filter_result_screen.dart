import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_app/class_providers/jobdata.dart';
import 'package:provider/provider.dart';

import '../components/components.dart';

class FilterResultScreen extends StatelessWidget {
  const FilterResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<JobData>(context, listen: false).jobData;
    return Column(
      children: [
        Container(
          height: 200.0,
          margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          color: Colors.transparent,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => CardBuilder(data: data['popularjobs'][index],),
            separatorBuilder: (context, index) => const SizedBox(width: 0.0),
            itemCount: data['popularjobs'].length,
          ),
        ),
      ],
    );
  }
}

