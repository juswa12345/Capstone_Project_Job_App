import 'package:flutter/material.dart';
import 'package:job_app/components/filter_dropDown.dart';
import 'package:job_app/models/filter_class.dart';
import 'package:job_app/widgets/job_type_filter.dart';
import 'package:job_app/widgets/widgets.dart';

class SetFilters extends StatelessWidget {
  const SetFilters({Key? key, required this.data}) : super(key: key);

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    final picker = FilterClass();
    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.only(
          top: 10.0,
          left: 20.0,
          bottom: 20.0,
          right: 20.0,
        ),
        decoration: const BoxDecoration(
          color: Color(0xffFBFBFB),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50),
            topLeft: Radius.circular(50),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 5,
              width: 80,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
                color: Colors.black12,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20.0,),
                text(20, TextAlign.center, false, 'Set Filters', FontWeight.w700),
                const SizedBox(height: 30.0,),
                FilterDropDown(datas: data),
                const SizedBox(height: 20.0,),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(child: DropDownMenu(icon: const Icon(Icons.location_on_outlined, color: Colors.grey,) , label: 'Location', category: picker.location(data['location']),)),
                    Flexible(child: DropDownMenu(icon: const Icon(Icons.account_balance_wallet_rounded, color: Colors.grey,), label: 'Salary', category: picker.category(data['category']),)),
                  ],
                ),
                const SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    text(18, TextAlign.left, false, 'Job Type', FontWeight.w600),
                    const Icon(Icons.more_horiz),
                  ],
                ),
                const SizedBox(height: 20.0,),
                const JobTypeFilters(),
                const SizedBox(height: 30.0,),
                const Buttons(route: '/', textContent: 'Apply Filters'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
