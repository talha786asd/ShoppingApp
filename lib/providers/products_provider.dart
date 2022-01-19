import 'package:flutter/material.dart';
import 'package:shopping_app/providers/product_provider.dart';

class ProductsProvider with ChangeNotifier {
  final List<ProductProvider> _items = [
    ProductProvider(
      id: "p1",
      title: "Watch",
      description: "World's No1 Watch",
      price: 3000,
      imageUrl:
          "https://cdn.vox-cdn.com/thumbor/eTQhbaxDs6MYk3P1i5uMICW_iuM=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/22908906/vpavic_211006_4796_0061.jpg",
    ),
    ProductProvider(
      id: "p2",
      title: "Fan",
      description: "World's No1 Fan",
      price: 10000,
      imageUrl:
          "https://breezefans.com/wp-content/uploads/2020/05/black-4-blade-pedestal-fan.jpg",
    ),
  ];
  List<ProductProvider> get items {
    return [..._items];
  }

  List<ProductProvider> get favouriteItems {
    return _items.where((prodItem) => prodItem.isFavourite).toList();
  }

  ProductProvider findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }
}
