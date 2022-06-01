import 'package:flutter/material.dart';
import 'package:job_app/class_providers/jobdata.dart';
import 'package:job_app/components/recent_post_builder.dart';
import 'package:job_app/widgets/widgets.dart';
import 'package:provider/provider.dart';


class RecentPostScreen extends StatelessWidget {
  const RecentPostScreen({Key? key, required this.data,}) : super(key: key);

  final JobData data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            'Recent Post',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
              fontSize: 20.0,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        child: ListView(
          children: [
            TopSearchBar(data: data.jobFilter,),
            const SizedBox(height: 20.0,),
            text(16, TextAlign.start, false, 'Job Opportunity'),
            RecentPostBuilder(data: data.recentPost,),
          ],
        ),
      ),
    );
  }
}
