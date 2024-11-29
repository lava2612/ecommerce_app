import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../providers/products_provider.dart';
import 'checkout_screen.dart';

class ProductDetailScreen extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double price;
  final String description;

  ProductDetailScreen({
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    final productsProvider = Provider.of<ProductsProvider>(context);
    final product = productsProvider.findByTitle(title); // Find product by title

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imageUrl,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '\₹${price.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Add to Favorites IconButton
                  Consumer<ProductsProvider>(
                    builder: (context, productsProvider, child) {
                      return IconButton(
                        icon: Icon(
                          product.isAddedToFavorite ? Icons.favorite : Icons.favorite_border,
                          color: product.isAddedToFavorite ? Colors.red : Colors.grey,
                        ),
                        onPressed: () {
                          // Toggle the favorite status
                          product.isAddedToFavorite = !product.isAddedToFavorite;
                          if (product.isAddedToFavorite) {
                            cartProvider.addItemToWishlist(product.id, product.title, product.imageUrl, product.description, product.price);
                          } else {
                            cartProvider.removeItemFromWishlist(product.id);
                          }

                          // Show feedback using SnackBar
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                product.isAddedToFavorite
                                    ? '$title added to favorites!'
                                    : '$title removed from favorites!',
                              ),
                              duration: const Duration(seconds: 1),
                            ),
                          );

                          // Notify listeners to update the UI immediately
                          productsProvider.notifyListeners();
                        },
                      );
                    },
                  ),

                  // Add to Cart IconButton
                  Consumer<ProductsProvider>(
                    builder: (context, productsProvider, child) {
                      return IconButton(
                        icon: Icon(
                          product.isAddedToCart ? Icons.shopping_cart : Icons.shopping_cart_outlined,
                          color: product.isAddedToCart ? Colors.blue : Colors.grey,
                        ),
                        onPressed: () {
                          // Toggle the cart status
                          product.isAddedToCart = !product.isAddedToCart;
                          if (product.isAddedToCart) {
                            cartProvider.addItemToCart(product.id, product.title, product.price,product.description,product.imageUrl);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Added to cart!'),
                                duration: Duration(seconds: 1),
                              ),
                            );
                          } else {
                            cartProvider.removeItemFromCart(product.id);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Removed from cart!'),
                                duration: Duration(seconds: 1),
                              ),
                            );
                          }

                          // Notify listeners to update the UI immediately
                          productsProvider.notifyListeners();
                        },
                      );
                    },
                  ),

                  // Go to Cart Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CheckoutScreen(),
                        ),
                      );
                    },
                    child: const Text('Go to Cart'),
                  ),

                  // Wishlist Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/wishlist');
                    },
                    child: const Text('Wishlist'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
