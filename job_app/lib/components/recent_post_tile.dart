import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_app/class_providers/jobdata.dart';
import 'package:job_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class BuildListView extends StatelessWidget {
  const BuildListView({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            spreadRadius: 1,
            blurRadius: 20,
            offset: const Offset(5, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ImageContainer(
              align: Alignment.center,
              width: 50,
              height: 50,
              imgUrl: data['imgUrl'],
            ),
            const SizedBox(
              width: 20.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                text(
                    16, TextAlign.start, false, data['title'], FontWeight.w600),
                text(12, TextAlign.start, false, data['job type'])
              ],
            ),
            const Spacer(),
            text(12, TextAlign.start, false, '\$${data['salary']}/m'),
          ],
        ),
      ),
    );
  }
}
