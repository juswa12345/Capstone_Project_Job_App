import 'package:flutter/material.dart';
import 'package:job_app/class_providers/jobdata.dart';
import 'package:job_app/components/components.dart';
import 'package:provider/provider.dart';
class RecentPost extends StatelessWidget {
  const RecentPost({
    Key? key, required this.data,
  }) : super(key: key);

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context){
    data['recent_jobs'].sort((a, b) => int.parse(a['time posted']).compareTo(int.parse(b['time posted'])));
    return Column(
      children: [
        Container(
          color: Colors.transparent,
          padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) => BuildListView(data: data['recent_jobs'][index]),
            separatorBuilder: (context, index) => const SizedBox(height: 20),
            itemCount: data['recent_jobs'].length,
          ),
        ),
      ],
    );
  }
}
