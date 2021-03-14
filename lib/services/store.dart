import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/models/product.dart';

class Store {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  addProduct(Product product) {
    Map<String, dynamic> data = {
      kProductName: product.pName,
      kProductPrice: product.pPrice,
      kProductCategory: product.pCategory,
      kProductDescription: product.pDescription,
      kProductLocation: product.pLocation,
    };

    _fireStore.collection(kProductsCollection).add(data);
  }

  Stream<QuerySnapshot> getProducts() {
    return _fireStore.collection(kProductsCollection).snapshots();
  }
}
