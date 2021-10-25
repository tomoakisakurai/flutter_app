import 'package:flutter/material.dart';
import 'package:flutter_app/app/screens/cart_empty.dart';
import 'package:flutter_app/app/screens/cart_full.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CartFull(),
    );
  }
}
