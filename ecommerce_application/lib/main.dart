import 'package:ecommerce_application/screens/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/homescreen.dart';
import 'providers/cart_provider.dart';
import 'screens/product_list_screen.dart';
import 'screens/product_detail_screen.dart';
import 'screens/checkout_screen.dart';
import 'screens/payment_success_screen.dart';
import 'providers/category_provider.dart';
import 'providers/products_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_)=>ProductsProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (ctx) => HomeScreen(),
        '/product-list': (ctx) => ProductListScreen(),
        '/product-detail': (ctx) {
          final product = ModalRoute.of(ctx)?.settings.arguments as Map<String, dynamic>;
          return ProductDetailScreen(
            title: product['title'], // Pass the product title
            imageUrl: product['imageUrl'], // Pass the product imageUrl
            price: product['price'],
            description: product['description'],
          );
        },
        '/checkout': (ctx) => CheckoutScreen(),
        '/payment-success': (ctx) => PaymentSuccessScreen(),
        '/wishlist':(ctx)=>WishlistScreen(),
      },
    );
  }
}
