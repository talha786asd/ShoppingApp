import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/products_provider.dart';
import 'package:shopping_app/widgets/product_item_widget.dart';

class ProductsGridWidget extends StatelessWidget {
 final bool showFavs;
 ProductsGridWidget(this.showFavs);
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductsProvider>(context, listen: false);
    final products = showFavs ? productData.favouriteItems : productData.items;

    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value: products[index],
        child: ProductItemWidget(),
      ),
    );
  }
}
