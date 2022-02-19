import 'package:experiment4/model/catalog.dart';
import 'package:experiment4/widgets/prod_img.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final Item item1;
  const Details({Key? key, required this.item1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(item1.name),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [Prod_Img(image: item1.image, h: 350, w: 450)],
          ),
        ),
      ),
    );
  }
}
