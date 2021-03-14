import 'package:e_commerce/constants.dart';
import 'package:e_commerce/screens/admin/add_product.dart';
import 'package:e_commerce/screens/admin/edit_product.dart';
import 'package:flutter/material.dart';

class AdminHomeScreen extends StatelessWidget {
  static String id = 'adminhome';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, AddProduct.id);
            },
            child: Text('Add Product'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, EditProduct.id);
            },
            child: Text('Edit Product'),
          ),
          RaisedButton(
            onPressed: () {},
            child: Text('View Orders'),
          ),
        ],
      ),
    );
  }
}
