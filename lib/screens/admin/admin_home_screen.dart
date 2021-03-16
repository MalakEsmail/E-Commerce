import 'package:e_commerce/constants.dart';
import 'package:e_commerce/screens/admin/add_product.dart';
import 'package:e_commerce/screens/admin/manage_product.dart';
import 'package:e_commerce/screens/admin/order_screen.dart';
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
              Navigator.pushNamed(context, ManageProduct.id);
            },
            child: Text('Edit Product'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, OrdersScreen.id);
            },
            child: Text('View Orders'),
          ),
        ],
      ),
    );
  }
}
