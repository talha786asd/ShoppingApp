import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart_provider.dart';
import 'package:shopping_app/screens/cart_screen.dart';
import 'package:shopping_app/widgets/badge_widget.dart';
import 'package:shopping_app/widgets/products_grid_widget.dart';
import 'package:shopping_app/widgets/text_widget.dart';

enum FilterOptions {
  Favourites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showFavouritesOnly = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const TextWidget(
          color: Colors.white,
          fontSize: 22,
          text: "My Shop",
          fontWeight: FontWeight.bold,
        ),
        actions: [
          PopupMenuButton(
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.Favourites) {
                    _showFavouritesOnly = true;
                  } else {
                    _showFavouritesOnly = false;
                  }
                });
              },
              itemBuilder: (_) => [
                    const PopupMenuItem(
                      child: TextWidget(
                          color: Colors.black,
                          fontSize: 15,
                          text: "Only Favourites"),
                      value: FilterOptions.Favourites,
                    ),
                    const PopupMenuItem(
                      child: TextWidget(
                          color: Colors.black, fontSize: 15, text: "Show All"),
                      value: FilterOptions.All,
                    )
                  ]),
          Consumer<CartProvider>(
            builder: (_, cart, ch) =>
                BadgeWidget(child: ch!, value: cart.itemCount.toString()),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
                icon: Icon(Icons.shopping_cart)),
          ),
        ],
      ),
      body: ProductsGridWidget(_showFavouritesOnly),
    ));
  }
}
