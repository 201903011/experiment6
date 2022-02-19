import 'package:experiment4/model/catalog.dart';
import 'package:experiment4/widgets/prod_img.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  final Item item1;
  const Details({Key? key, required this.item1}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  var num = 0;
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.item1.name),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add_shopping_cart),
              tooltip: 'Show Snackbar',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('cart is here')));
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Prod_Img(image: widget.item1.image, h: 250, w: 450),
              SizedBox(height: 5),
              Text(
                widget.item1.name,
                style: TextStyle(
                  fontSize: 40.0,
                ),
              ),
              SizedBox(height: 10),
              Text(widget.item1.desc),
            ],
          ),
        ),
        bottomSheet: Padding(
          padding: const EdgeInsets.only(
              left: 15.0, right: 5.0, bottom: 18, top: 15.0),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  if (num > 0) {
                    setState(() {
                      num = num - 1;
                    });
                  }
                },
                child: Icon(
                  Icons.remove_circle,
                  size: 35,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(num.toString(), style: TextStyle(fontSize: 25)),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    num = num + 1;
                  });
                },
                child: Icon(
                  Icons.add_circle,
                  size: 35,
                ),
              ),
              SizedBox(
                width: 80,
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(Icons.add_shopping_cart),
                      SizedBox(width: 10.0),
                      Text(
                        "Add to cart",
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
