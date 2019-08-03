import 'package:flutter/material.dart';

class ProductControl extends StatelessWidget {
  final Function addProduct;

  ProductControl(this.addProduct);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RaisedButton(
          color: Colors.blueAccent,
          onPressed: () {
            addProduct({'title': 'Coconut Oil', 'image': 'assets/coconut-oil.jpg'});
          },
          child: Text('Add Product'),
        ),
      ],
    );
  }
}
