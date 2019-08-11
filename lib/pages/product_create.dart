import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  final Function addProduct;

  ProductCreatePage(this.addProduct);

  @override
  State<StatefulWidget> createState() {
    return _ProductCreatePageState();
  }
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  String _titleValue;
  String _descriptionValue;
  double _priceValue;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildTitleTextField() {
    return TextFormField(
      validator: (String value) {
        if(value.isEmpty || value.length < 5) {
          return 'Title is required and should be more than 5 characters';
        }
      },
      decoration: InputDecoration(labelText: 'Product Title'),
      onSaved: (String value) {
        setState(() {
          _titleValue = value;
        });
      },
    );
  }

  Widget _buildDescriptionTextField() {
    return TextFormField(
      validator: (String value) {
        if(value.isEmpty || value.length < 10) {
          return 'Description is required and should be more than 10 characters';
        }
      },
      maxLines: 4,
      decoration: InputDecoration(labelText: 'Product Description'),
      onSaved: (String value) {
        setState(() {
          _descriptionValue = value;
        });
      },
    );
  }

  Widget _buildPriceTextField() {
    return TextFormField(
      validator: (String value) {
        double parsedValue = double.parse(value);
        if(!value.isEmpty && !RegExp(r'^[+]?([.]\d+|\d+([.]\d+)?)$').hasMatch(value)) {
          return 'Price has to be number and it is greater than 0';
        }
      },
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Product Price'),
      onSaved: (String value) {
        setState(() {
          _priceValue = double.parse(value);
        });
      },
    );
  }

  void _submitForm() {
    if(!_formKey.currentState.validate()) {
      return ;
    }
    _formKey.currentState.save();
    final Map<String, dynamic> product = {
      'title': _titleValue,
      'description': _descriptionValue,
      'price': _priceValue,
      'image': 'assets/food.jpg'
    };
    widget.addProduct(product);
    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWidth;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
      margin: EdgeInsets.all(10.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            _buildTitleTextField(),
            _buildDescriptionTextField(),
            _buildPriceTextField(),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              child: Text('Save'),
              textColor: Colors.white,
              onPressed: _submitForm,
            )
          ],
        ),
      ),
    );
  }
}
