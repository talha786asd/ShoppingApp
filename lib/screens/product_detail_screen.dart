import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/products_provider.dart';
import 'package:shopping_app/widgets/text_widget.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = "/product-detail";

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final loadedProducts =
        Provider.of<ProductsProvider>(context).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
            color: Colors.white, fontSize: 20, text: loadedProducts.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                loadedProducts.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextWidget(
                color: Colors.black,
                fontSize: 25,
                text: "\$${loadedProducts.price}"),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              child: TextWidget(
                color: Colors.grey,
                fontSize: 20,
                text: loadedProducts.description,
                align: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
