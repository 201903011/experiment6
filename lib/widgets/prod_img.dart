import 'package:flutter/material.dart';

class Prod_Img extends StatelessWidget {
  final String image;
  final double h;
  final double w;

  const Prod_Img({
    Key? key,
    required this.image,
    required this.h,
    required this.w,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 0.0),
      child: Container(
        padding: const EdgeInsets.all(5.0),
        color: Colors.grey.shade50,
        child: Image.asset(
          image,
          width: w,
          height: h,
        ),
      ),
    );
  }
}
