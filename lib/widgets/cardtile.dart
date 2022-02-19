import 'package:flutter/material.dart';

import 'prod_img.dart';

class Prod1 extends StatelessWidget {
  final double w1;
  final String im;
  const Prod1({Key? key, required this.w1, required this.im}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Prod_Img(
        image: im,
        h: 150,
        w: w1 / 2 - 20,
      ),
    );
  }
}
