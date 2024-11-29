import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/category_provider.dart';
import './category_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/logo.jpg',
              height: 40,
            ),
            SizedBox(width: 10),
            Text('E-Commerce App'),
          ],),),
      body: categoryProvider.categories.isEmpty
          ? Center(
        child: Text(
          'No categories available.',
          style: TextStyle(fontSize: 16),
        ),
      )
          : GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5, // Adjusting to 3 columns for smaller buttons
          crossAxisSpacing: 8, // Horizontal spacing between buttons
          mainAxisSpacing: 8, // Vertical spacing between buttons
          childAspectRatio: 1, // Maintain square aspect ratio
        ),
        itemCount: categoryProvider.categories.length,
        itemBuilder: (ctx, index) {
          final category = categoryProvider.categories[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      CategoryScreen(category: category.title),
                ),
              );
            },
            child: Card(
              elevation: 4,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100, // Smaller width for images
                    height: 100, // Smaller height for images
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: NetworkImage(category.imageUrl ?? ''),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 10), // Adding some space between image and text
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      category.title ?? 'No Title',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14, // Smaller text size
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
