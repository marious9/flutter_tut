import 'package:flutter/material.dart';

class ProductControl extends StatelessWidget {
  final Function addProduct;
  final Function deleteProducts;

  ProductControl(this.addProduct, this.deleteProducts);

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
        RaisedButton(
          color: Colors.red,
          onPressed: () {
            deleteProducts();
          },
          child: Text('Delete Products'),
        ),
      ],
    );
  }
}
