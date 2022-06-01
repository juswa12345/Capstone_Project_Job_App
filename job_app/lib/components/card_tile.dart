import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_app/widgets/widgets.dart';
import 'dart:math';

class CardBuilder extends StatelessWidget {
  const CardBuilder({
    Key? key, required this.data,
  }) : super(key: key);

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {

    final rand = Random().nextInt(3);

    return Row(
      children: [
        const SizedBox(
          width: 20.0,
        ),
        Container(
          height: 160,
          width: 260,
          padding: const EdgeInsets.all(15),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      ImageContainer(
                        align: Alignment.center,
                        width: 40,
                        height: 40,
                        imgUrl: data['imgUrl'],
                      ),
                      text(12, TextAlign.center, false, data['title'], FontWeight.w400),
                    ],
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.grey.withOpacity(0.03),
                    child: const Icon(Icons.favorite, color: Colors.red,),
                  )
                ],
              ),
              const SizedBox(height: 10.0,),
              text(16, TextAlign.start, false, data['category']['UI/UX Design'].keys.elementAt(rand), FontWeight.w500),
              const SizedBox(height: 10.0,),
              Row(
                children: [
                  text(12, TextAlign.start, false, '\$${data['category']['UI/UX Design'].values.elementAt(rand)}/m', FontWeight.w600),
                  text(12, TextAlign.start, false, '  ${data['location']}'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
