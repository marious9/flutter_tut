import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  Products(this.products);

//rewrite this component https://learning.oreilly.com/videos/learn-flutter-and/9781789951998/9781789951998-video6_16    4:08
  Widget _buildProductItem(BuildContext context, index) => Card(
        child: Column(
          children: <Widget>[
            Image.asset(products[index]['image']),
            Text(products[index]['title']),
            ButtonBar(alignment: MainAxisAlignment.center, children: <Widget>[
              FlatButton(
                  child: Text('Details'),
                  onPressed: () => Navigator.pushNamed<bool>(
                      context, '/product/' + index.toString())),
            ])
          ],
        ),
      );

  Widget _buildProductList() {
    Widget productCard = Center(
      child: Text('No products found, please add some'),
    );
    if (products.length > 0) {
      productCard = ListView.builder(
        itemBuilder: _buildProductItem,
        itemCount: products.length,
      );
    }

    return productCard;
  }

  @override
  Widget build(BuildContext context) {
    return _buildProductList();
  }
}
