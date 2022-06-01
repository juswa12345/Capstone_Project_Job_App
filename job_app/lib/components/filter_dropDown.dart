import 'package:flutter/material.dart';
import 'package:job_app/models/filter_class.dart';
import 'package:job_app/widgets/widgets.dart';

class FilterDropDown extends StatefulWidget {
  const FilterDropDown({Key? key, required this.datas})
      : super(key: key);

  @override
  State<FilterDropDown> createState() => _FilterDropDownState();

  final Map<String, dynamic> datas;

}

class _FilterDropDownState extends State<FilterDropDown> {

  final picker = FilterClass();

  String? currentValue;
  String? currentSubValue;
  String? hintSubValue;
  int currentIndex = 0;

  List<String> category = [];
  List<String> subCategory = [];

  @override
  Widget build(BuildContext context) {
    var data = widget.datas['category'];
    category = picker.category(data);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text(18, TextAlign.start, false, 'Category', FontWeight.w700),
        Container(
          padding: const EdgeInsets.only(left: 12.0, right: 12.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: currentValue,
              isExpanded: true,
              elevation: 0,
              iconSize: 20,
              hint: text(16,TextAlign.start, false, category[0]),
              disabledHint: text(16,TextAlign.start, false, category[0]),
              icon: const Icon(
                Icons.expand_more_rounded,
              ),
              items: category.map(buildCategoryItem).toList(),
              onChanged: (value) {
                setState(() {
                    currentValue = value!;
                    currentIndex = category.indexOf(value);
                    currentSubValue = null;
                });
                if(currentIndex == 0){
                  subCategory = picker.subCategory(data, currentIndex);
                } else if (currentIndex == 1){
                  subCategory = picker.subCategory(data, currentIndex);
                } else {
                  subCategory = picker.subCategory(data, currentIndex);
                }
              },
            ),
          ),
        ),
        const SizedBox(height: 20.0,),
        text(18, TextAlign.start, false, 'Sub Category', FontWeight.w700),
        Container(
          padding: const EdgeInsets.only(left: 12.0, right: 12.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: currentSubValue,
              isExpanded: true,
              elevation: 0,
              iconSize: 20,
              hint: text(16,TextAlign.start, false, (hintSubValue == null) ? '-----' : hintSubValue!),
              disabledHint: text(16,TextAlign.start, false, (hintSubValue == null) ? '-----' : hintSubValue!),
              icon: const Icon(
                Icons.expand_more_rounded,
              ),
              items: subCategory.map(buildSubCategoryItem).toList(),
              onChanged: (value) {
                setState(() {
                  currentSubValue = value!;
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  DropdownMenuItem<String> buildCategoryItem(String item) => DropdownMenuItem(
    value: item,
    child: text(16, TextAlign.left, false, item),
  );

  DropdownMenuItem<String> buildSubCategoryItem(String item) => DropdownMenuItem(
    value: item,
    child: text(16, TextAlign.left, false, item),
  );
}
