import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:tutorial_app/scope-models/product.dart';
import '../pages/product_edit.dart';

import '../models/product.dart';

class ProductListPage extends StatelessWidget {
  ProductListPage();

  Widget _buildEditButton(BuildContext context, int index, ProductsModel model) {
    return IconButton(
      icon: Icon(Icons.edit),
      onPressed: () {
        model.selectProduct(index);
        Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) {
            return ProductEditPage();
          },
        ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ProductsModel>(
      builder: (BuildContext context, Widget child, ProductsModel model) {
        final List<Product> products = model.products;
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              onDismissed: (DismissDirection direction) {
                if (direction == DismissDirection.endToStart) {
                  model.selectProduct(index);
                  model.deleteProduct();
                }
              },
              key: Key(products[index].title),
              background: Container(color: Colors.red),
              child: Column(children: <Widget>[
              ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(products[index].image),
                  ),
                  title: Text(products[index].title),
                  subtitle: Text('\$${products[index].price.toString()}'),
                  trailing: _buildEditButton(context, index, model)),
              Divider(),
            ]),
          );
        },
        itemCount: products.length,
      );
    });
  }
}
