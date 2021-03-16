import 'package:e_commerce/provider/adminmode.dart';
import 'package:e_commerce/provider/modalhud.dart';
import 'package:e_commerce/screens/admin/add_product.dart';
import 'package:e_commerce/screens/admin/admin_home_screen.dart';
import 'package:e_commerce/screens/admin/edit_product.dart';
import 'package:e_commerce/screens/admin/manage_product.dart';
import 'package:e_commerce/screens/users/home_screen.dart';
import 'package:e_commerce/screens/login_screen.dart';
import 'package:e_commerce/screens/signup_screen.dart';
import 'package:e_commerce/screens/users/product_info.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ModalHud>(
          create: (context) => ModalHud(),
        ),
        ChangeNotifierProvider<AdminMode>(
          create: (context) => AdminMode(),
        )
      ],
      child: MaterialApp(initialRoute: LoginScreen.id, routes: {
        LoginScreen.id: (context) => LoginScreen(),
        SignUpScreen.id: (context) => SignUpScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        AdminHomeScreen.id: (context) => AdminHomeScreen(),
        AddProduct.id: (context) => AddProduct(),
        ManageProduct.id: (context) => ManageProduct(),
        EditProduct.id: (context) => EditProduct(),
        ProductInfo.id: (context) => ProductInfo(),
      }),
    );
  }
}
