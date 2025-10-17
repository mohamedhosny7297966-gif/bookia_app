

import 'package:bookia/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Cart",withBackBottom: false,),
    );
  }
}
