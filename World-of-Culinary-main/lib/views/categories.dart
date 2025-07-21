import 'package:flutter/material.dart';
import 'package:recipe_app/views/appetizers.dart';
import 'package:recipe_app/views/desserts.dart';
import 'package:recipe_app/views/drinks.dart';
import 'package:recipe_app/views/maincourse.dart';
import 'package:recipe_app/views/salads.dart';
import 'package:recipe_app/views/snacks.dart';

void main() {
  runApp(const MyRecipeApp());
}

class MyRecipeApp extends StatelessWidget {
  const MyRecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CategoriesCatalog(),
    );
  }
}

class CategoriesCatalog extends StatelessWidget {
  final List<String> categories = [
    'Appetizers',
    'Main Course',
    'Desserts',
    'Drinks',
    'Salads',
    'Snacks',
  ];

  CategoriesCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe Categories'),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryTile(category: categories[index]);
        },
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String category;

  const CategoryTile({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        title: Text(
          category,
          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        onTap: () {
          // Navigate to the corresponding screen based on the selected category
          switch (category) {
            case 'Appetizers':
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AppetizersScreen()),
              );
              break;
            case 'Main Course':
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainCourseScreen()),
              );
              break;
            case 'Desserts':
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DessertsScreen()),
              );
              break;
            case 'Drinks':
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DrinksScreen()),
              );
              break;
            case 'Salads':
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SaladsScreen()),
              );
              break;
            case 'Snacks':
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SnacksScreen()),
              );
              break;

            default:
              // Handle cases for unknown categories
              print('Unknown category: $category');
          }
        },
      ),
    );
  }
}

class AppetizerCard extends StatelessWidget {
  final String title;
  final String image;

  const AppetizerCard({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          // Navigate back to CategoriesCatalog screen when an appetizer is tapped
          Navigator.pop(context);
        },
        child: Column(
          children: [
            Image.asset(
              image,
              width: double.infinity,
              height: 150.0,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
