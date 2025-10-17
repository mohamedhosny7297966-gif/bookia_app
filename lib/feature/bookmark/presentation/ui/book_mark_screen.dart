



import 'package:bookia/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class BookMarkScreen extends StatelessWidget {
  const BookMarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Book Mark",withBackBottom: false,),
    );
  }
}
