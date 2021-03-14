import 'package:e_commerce/constants.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/services/store.dart';
import 'package:e_commerce/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class EditProduct extends StatelessWidget {
  static String id = 'editProduct';
  String _name, _price, _description, _category, _location;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _store = Store();

  @override
  Widget build(BuildContext context) {
    Product product = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Form(
          key: _key,
          child: ListView(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextField(
                    icon: Icons.add,
                    hint: 'Product Name',
                    onClick: (value) {
                      _name = value;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    icon: Icons.add,
                    hint: 'Product Price',
                    onClick: (value) {
                      _price = value;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    icon: Icons.add,
                    hint: 'Product Description',
                    onClick: (value) {
                      _description = value;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    icon: Icons.add,
                    hint: 'Product Category',
                    onClick: (value) {
                      _category = value;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    icon: Icons.add,
                    hint: 'Product location',
                    onClick: (value) {
                      _location = value;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FlatButton(
                    onPressed: () {
                      if (_key.currentState.validate()) {
                        _key.currentState.save();
                        _store.editProduct(
                            ({
                              kProductName: _name,
                              kProductLocation: _location,
                              kProductDescription: _description,
                              kProductCategory: _category,
                              kProductPrice: _price,
                            }),
                            product.pId);
                      }
                    },
                    child: Text('Add Product'),
                  )
                ],
              ),
            ],
          )),
    );
  }
}
