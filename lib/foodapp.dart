import 'package:flutter/material.dart';

import 'Mydrawer.dart';
import 'cardtile.dart';

class FoodApp extends StatelessWidget {
  const FoodApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: const Text('Food App'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_shopping_cart),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('cart is here')));
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('search is not available')));
            },
          ),
        ],
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Prod1(
                      w1: width - 16,
                      im: 'assets/images/myfood.jpeg',
                    ),
                    Prod1(
                      w1: width - 16,
                      im: 'assets/images/icecream.jpeg',
                    ),
                  ],
                ),
                Row(
                  children: [
                    Prod1(
                      w1: width - 16,
                      im: 'assets/images/food.jpeg',
                    ),
                    Prod1(
                      w1: width - 16,
                      im: 'assets/images/juice.jpeg',
                    ),
                  ],
                ),
                Row(
                  children: [
                    Prod1(
                      w1: width - 16,
                      im: 'assets/images/myfood.jpeg',
                    ),
                    Prod1(
                      w1: width - 16,
                      im: 'assets/images/icecream.jpeg',
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(26.0),
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('You are submitted')));
                    },
                    child: Text("Submit"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.indigo.shade50,
    );
  }
}
