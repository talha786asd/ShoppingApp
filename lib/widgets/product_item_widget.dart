import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart_provider.dart';
import 'package:shopping_app/providers/product_provider.dart';
import 'package:shopping_app/screens/product_detail_screen.dart';
import 'package:shopping_app/widgets/text_widget.dart';

class ProductItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductProvider>(context, listen: false);
    final cart = Provider.of<CartProvider>(context);

    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
                arguments: product.id);
          },
          child: GridTile(
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
            footer: GridTileBar(
              backgroundColor: Colors.red,
              title: TextWidget(
                  align: TextAlign.center,
                  color: Colors.white,
                  fontSize: 20,
                  text: product.title),
              leading: Consumer<ProductProvider>(
                builder: (context, value, _) => IconButton(
                    onPressed: () {
                      product.toggleFavouriteStatus();
                    },
                    icon: Icon(product.isFavourite
                        ? Icons.favorite
                        : Icons.favorite_border)),
              ),
              trailing: IconButton(
                onPressed: () {
                  cart.addItem(product.id, product.price, product.title);
                },
                icon: Icon(Icons.shopping_cart),
              ),
            ),
          ),
        ));
  }
}
