import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    Key? key,
    required this.align,
    required this.width,
    required this.height,
    required this.imgUrl,
  }) : super(key: key);

  final Alignment align;
  final double width;
  final double height;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: align,
      child: Image.asset(
        imgUrl,
        fit: BoxFit.cover,
        width: width,
        height: width,
      ),
    );
  }
}
