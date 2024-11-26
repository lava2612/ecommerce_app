import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductsProvider with ChangeNotifier {
  // Sample list of products
  final List<Product> _items = [
    Product(
      id: 'p1',
      title: 'T-Shirt',
      description: 'A t shirt - it is pretty cool!',
      price: 1449,
      imageUrl: 'assets/images/Categories/mens_wear/tshirt.jpg',
      category: 'Mens Wear',
    ),
    Product(
      id: 'p2',
      title: 'Blue Jeans',
      description: 'Stylish blue jeans for all occasions.',
      price: 999,
      imageUrl: 'assets/images/Categories/mens_wear/jeans.jpg',
      category: 'Mens Wear',
    ),
    Product(
      id: 'p3',
      title: 'Laptop',
      description: 'High-performance laptop for work and gaming.',
      price: 120000,
      imageUrl: 'assets/images/Categories/Electronics/laptop.jpg',
      category: 'Electronics',
    ),
    Product(
      id: 'p4',
      title: 'Smartwatch',
      description: 'Latest smartwatch with cutting-edge features.',
      price: 2499,
      imageUrl: 'assets/images/Categories/Electronics/smartwatch.jpg',
      category: 'Electronics',
    ),
    Product(
      id: 'p5',
      title: 'Running Shoes',
      description: 'Lightweight and durable running shoes.',
      price: 599,
      imageUrl: 'assets/images/Categories/Foot_Wear/running_shoes.jpg',
      category: 'Foot Wear',
    ),
    Product(
      id: 'p6',
      title: 'High Heels',
      description: 'Make people chin up to see you!',
      price: 499,
      imageUrl: 'assets/images/Categories/Foot_Wear/high_heels.jpg',
      category: 'Foot Wear',
    ),
    Product(
      id: 'p7',
      title: 'Cotton Saree',
      description: 'Beautiful saree which gives beauty with comfort',
      price: 5699,
      imageUrl: 'assets/images/Categories/womens_wear/saree.jpg',
      category: 'Womens Wear',
    ),
    Product(
      id: 'p8',
      title: 'Half Saree',
      description: 'Half Saree which gives you a look like Half Moon from the sky',
      price: 8999,
      imageUrl: 'assets/images/Categories/womens_wear/half_saree.jpg',
      category: 'Womens Wear',
    ),
    Product(
      id: 'p9',
      title: 'The Art of Being Alone',
      description: 'The book which helps you to focus on who you are',
      price: 149,
      imageUrl: 'assets/images/Categories/books/art_of_being_alone.jpg',
      category: 'Books',
    ),
    Product(
      id: 'p10',
      title: 'Bagavadgita',
      description: 'The Book which tells you the truth of life and soul',
      price: 299,
      imageUrl: 'assets/images/Categories/books/bagavadgita.jpg',
      category: 'Books',
    ),
    Product(
      id: 'p11',
      title: 'RadhaKrishna Idol',
      description: 'The idol of true love',
      price: 499,
      imageUrl: 'assets/images/Categories/godidols/radhakrishna.jpg',
      category: 'God Idols',
    ),
    Product(
      id: 'p12',
      title: 'Lord Vinayaka Idol',
      description: 'The lord of happiness is here to come your home',
      price: 501,
      imageUrl: 'assets/images/Categories/godidols/vinayaka.jpg',
      category: 'God Idols',
    ),
    Product(
      id: 'p13',
      title: 'Air Conditioner',
      description: 'Air Conditioner which makes you cool',
      price: 5000,
      imageUrl: 'assets/images/Categories/Home_Appliances/ac.jpg',
      category: 'Home Appliances',
    ),
    Product(
      id: 'p14',
      title: 'Washing Machine',
      description: 'The machine which cleans the clothes smoothly and dries instantly',
      price: 21199,
      imageUrl: 'assets/images/Categories/Home_Appliances/washing_machine.jpg',
      category: 'Home Appliances',
    ),
    Product(
      id: 'p15',
      title: 'Unique lamp',
      description: 'Unique Bed light lamp for your lovely sleep',
      price: 499,
      imageUrl: 'assets/images/Categories/home_decors/unique_lamp.jpg',
      category: 'Home Decors',
    ),
    Product(
      id: 'p16',
      title: 'Wall Poster',
      description: 'Increase the beauty of your hall by adding this intensified poster',
      price: 699,
      imageUrl: 'assets/images/Categories/home_decors/wall_poster.jpg',
      category: 'Home Decors',
    ),
    Product(
      id: 'p17',
      title: 'Cotton Checks Shirt',
      description: 'Brand new shirt for children under age 10',
      price: 349,
      imageUrl: 'assets/images/Categories/kids_wear/cotton_checks_shirt.jpg',
      category: 'Kids Wear',
    ),
    Product(
      id: 'p18',
      title: 'Summer Dress for Girls',
      description: 'Be cute in this summer with the electrifying dress',
      price: 449,
      imageUrl: 'assets/images/Categories/kids_wear/summer_dress.jpg',
      category: 'Kids Wear',
    ),
    Product(
      id: 'p19',
      title: 'Gas Stove',
      description: 'Brand new gas stove with glass label',
      price: 769,
      imageUrl: 'assets/images/Categories/Kitchen_appliances/gas_stove.jpg',
      category: 'Kitchen Appliances',
    ),
    Product(
      id: 'p20',
      title: 'Mixer for kitchen use',
      description: 'The tasty juice is on the way!',
      price: 359,
      imageUrl: 'assets/images/Categories/Kitchen_appliances/mixer.jpg',
      category: 'Kitchen Appliances',
    ),
    Product(
      id: 'p21',
      title: 'Party Girl (A fragrant perfume for girls)',
      description: 'Let your redolance speak before you',
      price: 599,
      imageUrl: 'assets/images/Categories/Perfumes/party_girl.jpg',
      category: 'Perfumes',
    ),
    Product(
      id: 'p22',
      title: 'Toy Boys(An aroma of success)',
      description: 'The intense of the incense',
      price: 599,
      imageUrl: 'assets/images/Categories/Perfumes/toy_boys.jpg',
      category: 'Perfumes',
    ),
  ];

  // Getter for all products
  List<Product> get products {
    return [..._items];
  }

  // Method to filter products by category
  List<Product> filterByCategory(String category) {
    return _items.where((product) => product.category == category).toList();
  }

  // Method to toggle favorite status of a product
  void toggleFavorite(String id) {
    final index = _items.indexWhere((product) => product.id == id);
    if (index != -1) {
      _items[index].isAddedToFavorite = !_items[index].isAddedToFavorite;
      notifyListeners();
    }
  }

  // Getter for favorite products
  List<Product> get favoriteItems {
    return _items.where((product) => product.isAddedToFavorite).toList();
  }
  Product findByTitle(String title) {
    return _items.firstWhere(
          (product) => product.title == title,
      orElse: () => throw Exception('Product not found!'),
    );
  }
}
