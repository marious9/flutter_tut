import 'package:flutter/material.dart';
import './product_control.dart';
import './products.dart';

class ProductManager extends StatefulWidget {
  final Map<String, String> startingProduct;

  ProductManager({this.startingProduct});

  @override
  State<StatefulWidget> createState() {
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  List<Map<String, String>> _products = [];

  @override
  void initState() {
    if(widget.startingProduct != null)
      _products.add(widget.startingProduct);
    super.initState();
  }

  @override
  void didUpdateWidget(ProductManager oldWidget) {
    print('[ProductManager State] didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  void _addProduct(Map<String, String> product) {
    setState(() {
      _products.add(product);
    });
  }

  void _deleteProduct(int index) {
    setState(() {
     _products.removeAt(index);
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
        Expanded(child: Products(_products, deleteProduct: _deleteProduct))
      ],
    );
  }
}
