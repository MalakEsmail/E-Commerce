import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/screens/admin/edit_product.dart';
import 'package:e_commerce/services/store.dart';
import 'package:e_commerce/widgets/custom_menu.dart';
import 'package:flutter/material.dart';

class ManageProduct extends StatefulWidget {
  static String id = 'manageproduct';

  @override
  _ManageProductState createState() => _ManageProductState();
}

class _ManageProductState extends State<ManageProduct> {
  final _store = Store();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: _store.getProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Product> products = [];
            for (var doc in snapshot.data.docs) {
              var data = doc.data();
              products.add(Product(
                  pId: doc.id,
                  pName: data[kProductName],
                  pPrice: data[kProductPrice],
                  pCategory: data[kProductCategory],
                  pDescription: data[kProductDescription],
                  pLocation: data[kProductLocation]));
            }
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.8),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTapUp: (details) async {
                      double dx = details.globalPosition.dx;
                      double dy = details.globalPosition.dy;
                      double dx2 = MediaQuery.of(context).size.width - dx;
                      double dy2 = MediaQuery.of(context).size.width - dy;

                      await showMenu(
                          context: context,
                          items: [
                            MyPopupMenuItem(
                              onClick: () {
                                Navigator.pushNamed(context, EditProduct.id,
                                    arguments: products[index]);
                              },
                              child: Text('Edit'),
                            ),
                            MyPopupMenuItem(
                              onClick: () {
                                _store.deleteProduct(products[index].pId);

                                Navigator.pop(context);
                              },
                              child: Text('Delete'),
                            ),
                          ],
                          position: RelativeRect.fromLTRB(dx, dy, dx2, dy2));
                    },
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Image(
                            fit: BoxFit.fill,
                            image: AssetImage(products[index].pLocation),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Opacity(
                            opacity: .6,
                            child: Container(
                              height: 60,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      products[index].pName,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text('\$ ${products[index].pPrice}')
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: products.length,
            );
          } else {
            return Center(child: Text('Loading...'));
          }
        },
      ),
    );
  }
}
