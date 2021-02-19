import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/services/store.dart';
import 'package:e_commerce/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatelessWidget {
  static String id = 'addproduct';
  String _name, _price, _description, _category, _location;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _store = Store();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _key,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              hint: 'Product Name',
              onClick: (value) {
                _name = value;
              },
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              hint: 'Product Price',
              onClick: (value) {
                _price = value;
              },
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              hint: 'Product Description',
              onClick: (value) {
                _description = value;
              },
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              hint: 'Product Category',
              onClick: (value) {
                _category = value;
              },
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              hint: 'Product location',
              onClick: (value) {
                _location = value;
              },
            ),
            SizedBox(
              height: 20,
            ),
            FlatButton(
              onPressed: () async {
                if (_key.currentState.validate()) {
                  _key.currentState.save();
                  await _store.addProduct(Product(
                      pName: _name,
                      pCategory: _category,
                      pDescription: _description,
                      pLocation: _location,
                      pPrice: _price));
                }
              },
              child: Text('Add Product'),
            )
          ],
        ),
      ),
    );
  }
}
