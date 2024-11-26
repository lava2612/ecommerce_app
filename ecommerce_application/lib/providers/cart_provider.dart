import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// CartItem Model
class CartItem {
  final String id;
  final String title;
  final String imageUrl;
  final double price;
  final String description;
  int quantity;

  CartItem({
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.description,
    required this.quantity,
  });

  // Convert CartItem to JSON
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'quantity': quantity,
    };
  }

  // Convert JSON to CartItem
  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      id: map['id'],
      title: map['title'],
      price: map['price'],
      quantity: map['quantity'],
      description: map['description'],
      imageUrl: map['imageUrl'],
    );
  }
}

// WishlistItem Model
class WishlistItem {
  final String id;
  final String title;
  final String imageUrl;
  final String description;
  final double price;

  WishlistItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.price,
  });

  // Convert WishlistItem to JSON
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      'description':description,
      'price':price,
    };
  }

  // Convert JSON to WishlistItem
  factory WishlistItem.fromMap(Map<String, dynamic> map) {
    return WishlistItem(
      id: map['id'],
      title: map['title'],
      imageUrl: map['imageUrl'],
      description: map['description'],
      price: map['price'],
    );
  }
}

// CartProvider with SharedPreferences
class CartProvider with ChangeNotifier {
  List<CartItem> _items = [];
  List<WishlistItem> _wishlist = [];

  // Getters for the cart and wishlist items
  List<CartItem> get items => _items;
  List<WishlistItem> get wishlist => _wishlist;

  double get totalPrice {
    return _items.fold(0.0, (sum, item) => sum + (item.price * item.quantity));
  }
  // Load data from SharedPreferences
  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    final cartData = prefs.getString('cart') ?? '[]';
    final wishlistData = prefs.getString('wishlist') ?? '[]';

    final List<dynamic> cartJson = json.decode(cartData);
    final List<dynamic> wishlistJson = json.decode(wishlistData);

    _items = cartJson.map((item) => CartItem.fromMap(item)).toList();
    _wishlist = wishlistJson.map((item) => WishlistItem.fromMap(item)).toList();

    notifyListeners();
  }

  // Save data to SharedPreferences
  Future<void> saveData() async {
    final prefs = await SharedPreferences.getInstance();

    final cartJson = json.encode(_items.map((item) => item.toMap()).toList());
    final wishlistJson = json.encode(_wishlist.map((item) => item.toMap()).toList());

    await prefs.setString('cart', cartJson);
    await prefs.setString('wishlist', wishlistJson);
  }

  // Add item to cart
  void addItemToCart(String id, String title, double price,String description,String imageUrl) {
    final existingIndex = _items.indexWhere((item) => item.id == id);
    if (existingIndex >= 0) {
      _items[existingIndex].quantity++;
    } else {
      _items.add(CartItem(id: id, title: title, price: price, quantity: 1, description: description, imageUrl: imageUrl));
    }
    saveData(); // Save to SharedPreferences after adding
    notifyListeners();
  }

  // Add item to wishlist
  void addItemToWishlist(String id, String title, String imageUrl,String description,double price) {
    final existingIndex = _wishlist.indexWhere((item) => item.id == id);
    if (existingIndex >= 0) {
      _wishlist.removeAt(existingIndex); // Remove if already in wishlist
    } else {
      _wishlist.add(WishlistItem(id: id, title: title, imageUrl: imageUrl,description: description, price: price));
    }
    saveData(); // Save to SharedPreferences after adding
    notifyListeners();
  }

  // Remove item from cart
  void removeItemFromCart(String id) {
    _items.removeWhere((item) => item.id == id);
    saveData(); // Save to SharedPreferences after removing
    notifyListeners();
  }

  // Remove item from wishlist
  void removeItemFromWishlist(String id) {
    _wishlist.removeWhere((item) => item.id == id);
    saveData(); // Save to SharedPreferences after removing
    notifyListeners();
  }
}
