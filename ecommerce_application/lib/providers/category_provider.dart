import 'package:flutter/material.dart';
import 'products_provider.dart';
import '../models/product.dart';

class CategoryItem {
  final String id;
  final String title;
  final String imageUrl;

  CategoryItem({
    required this.id,
    required this.title,
    required this.imageUrl,
  });
}
class CategoryProvider with ChangeNotifier {
  // List of categories
  List<CategoryItem> _categories = [
    CategoryItem(id: 'c1', title: 'Electronics', imageUrl: 'assets/images/Categories/Electronics/electronic.jpg'),
    CategoryItem(id: 'c2', title: 'Foot Wear', imageUrl: 'assets/images/Categories/Foot_Wear/footwear.jpg'),
    CategoryItem(id: 'c3', title: 'Home Appliances', imageUrl: 'assets/images/Categories/Home_Appliances/home_appliances.jpg'),
    CategoryItem(id: 'c4', title: 'Home Decors', imageUrl: 'assets/images/Categories/home_decors/homedecors.jpg'),
    CategoryItem(id: 'c5', title: 'Perfumes', imageUrl: 'assets/images/Categories/Perfumes/perfumes.jpg'),
    CategoryItem(id: 'c6', title: 'Womens Wear', imageUrl: 'assets/images/Categories/womens_wear/womenswear.jpg'),
    CategoryItem(id: 'c7', title: 'Mens Wear', imageUrl: 'assets/images/Categories/mens_wear/menswear.jpg'),
    CategoryItem(id: 'c8', title: 'Kids Wear', imageUrl: 'assets/images/Categories/kids_wear/kidswear.jpg'),
    CategoryItem(id: 'c9', title: 'Books', imageUrl: 'assets/images/Categories/books/books.jpg'),
    CategoryItem(id: 'c10', title: 'God Idols', imageUrl: 'assets/images/Categories/godidols/godidols.jpg'),
    CategoryItem(id: 'c11', title: 'Kitchen Appliances', imageUrl: 'assets/images/Categories/Kitchen_appliances/kitchen_appliances.jpg')
  ];
  // Getters for categories and products
  List<CategoryItem> get categories => [..._categories];
  List<Product> get products => [...products];

  // Filter products by category
  List<Product> getProductsByCategory(String category, ProductsProvider productsProvider) {
      return productsProvider.filterByCategory(category);
  }
}
