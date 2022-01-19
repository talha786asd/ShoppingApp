import 'package:flutter/material.dart';
import 'package:shopping_app/widgets/text_widget.dart';

class CartScreen extends StatelessWidget {
  static const routeName = "/cart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          color: Colors.white,
           fontSize: 20,
            text: "Your Cart"
            ),
      ),
      body: Column(
        children: [
          
        ],
      ),
    );
  }
}
