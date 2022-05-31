import 'package:flutter/material.dart';
import 'package:job_app/models/my_flutter_app_icons.dart';
import 'package:job_app/screens/screens.dart';

class TopSearchBar extends StatelessWidget {
  const TopSearchBar({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    print(data['filter'][0]['category'].values.elementAt(0)[0]);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(18.0)),
              color: Colors.white,
            ),
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Search here...',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 20.0,
        ),
        Container(
          height: 44,
          width: 44,
          decoration: const BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
          ),
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (_) => SetFilters(data: data['filter'][0]),
                isScrollControlled: true,
              );
            },
            child: Image.asset('assets/icons/Go BTN.png'),
          )
        ),
      ],
    );
  }
}
