import 'package:flutter/foundation.dart';
class Product with ChangeNotifier{
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final String category;
  bool isAddedToFavorite;
  bool isAddedToCart;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
    this.isAddedToFavorite = false,
    this.isAddedToCart=false,
  });

void toggleFavoriteStatus() {
  isAddedToFavorite = !isAddedToFavorite;
  notifyListeners();
}

void toggleCartStatus() {
  isAddedToCart = !isAddedToCart;
  notifyListeners();
}
}