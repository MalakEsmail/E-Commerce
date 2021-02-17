import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final IconData icon;
  CustomTextField({@required this.hint, @required this.icon});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // ignore: missing_return
      validator: (value) {
        if (value.isEmpty) {
          return 'value is empty';
        }
      },
      cursorColor: kMainColor,
      decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(
            icon,
            color: kMainColor,
          ),
          filled: true,
          fillColor: kSecondaryColor,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.white)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.white)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.white))),
    );
  }
}
