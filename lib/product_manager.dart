import 'package:flutter/material.dart';
import './product_control.dart';
import './products.dart';

class ProductManager extends StatefulWidget {
  final String startingProduct;

  ProductManager(this.startingProduct);

  @override
  State<StatefulWidget> createState() {
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  List<String> _products = [];

  @override
  void initState() {
    _products.add(widget.startingProduct);
    super.initState();
  }

  @override
  void didUpdateWidget(ProductManager oldWidget) {
    print('[ProductManager State] didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  void _addProduct(String product) {
    setState(() {
      _products.add('ur mom');
    });
  }

  void _deleteProducts() {
    setState(() {
     if(_products.length > 0) {
       _products = [];
     }
    });
  }

  @override
  Widget build(BuildContext build) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10.0),
          child: ProductControl(_addProduct, _deleteProducts),
        ),
        Products(_products)
      ],
    );
  }
}
