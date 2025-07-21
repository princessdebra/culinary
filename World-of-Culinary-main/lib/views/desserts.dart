import 'package:flutter/material.dart';

void main() {
  runApp(const MyRecipeApp());
}

class MyRecipeApp extends StatelessWidget {
  const MyRecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DessertsScreen(),
    );
  }
}

class DessertsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> desserts = [
    {
      'title': 'Chocolate Cake',
      'image': 'assets/images/chocolate-cake.jpg',
      'ingredients': [
        '1. Granulated sugar, brown sugar and powdered',
        '2. Cocoa powder',
        '3. Baking soda',
        '4. Salt',
        '5. Eggs and egg yolks'
      ],
      'instructions': [
        '1. Heat oven and prepare pans: Preheat oven to 350 degrees. Butter two 9-inch round cake pans then line bottom of each with a round of parchment paper. Butter parchment paper. Wrap cake pans with baking strips for the most level cake.',
        '2. Mix dry ingredients, then mix in boiling water: In a large, heat proof mixing bowl, whisk together granulated sugar brown sugar, cocoa powder, baking soda and salt. Allow to cool 5 minutes.',
        '3. Pour into pans and bake: Divide mixture evenly among 2 prepared pans. Bake in preheated oven until toothpick inserted into center of cake comes out clean, about 29 – 34 minutes.'
      ],
    },
    {
      'title': 'Strawberry Cheesecake',
      'image': 'assets/images/strawberrycheesecake.jpg',
      'ingredients': [
        '1. Strawberries',
        '2. Graham crackers',
        '3. Granulated sugar',
        '4. Butter',
        '5. Cream cheese'
      ],
      'instructions': [
        '1. Preheat oven to 350 degrees',
        '2. Make the crust mixture: in a medium mixing bowl stir together graham crackers with granulated sugar. Pour in butter and stir until evenly moistened.',
        '3. Press into pan: Press graham crackers into an even layer along the bottom and about halfway up the sides of a 9-inch springform pan.',
        '4. Bake to set: Bake in preheated oven 9-minutes, remove and let cool on a wire rack.'
      ],
    },
  ];

  DessertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Desserts'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bacc.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: desserts.length,
          itemBuilder: (context, index) {
            return DessertsCard(
              title: desserts[index]['title']!,
              image: desserts[index]['image']!,
              ingredients: List<String>.from(desserts[index]['ingredients']),
              instructions: List<String>.from(desserts[index]['instructions']),
            );
          },
        ),
      ),
    );
  }
}

class DessertsCard extends StatelessWidget {
  final String title;
  final String image;
  final List<String> ingredients;
  final List<String> instructions;

  const DessertsCard({
    super.key,
    required this.title,
    required this.image,
    required this.ingredients,
    required this.instructions,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipePage(
              title: title,
              image: image,
              ingredients: ingredients,
              instructions: instructions,
            ),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.all(10.0),
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
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RecipePage extends StatelessWidget {
  final String title;
  final String image;
  final List<String> ingredients;
  final List<String> instructions;

  const RecipePage({
    super.key,
    required this.title,
    required this.image,
    required this.ingredients,
    required this.instructions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bacc.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              width: double.infinity,
              height: 200.0,
              fit: BoxFit.cover,
            ),
            _buildSection('Ingredients:', ingredients),
            _buildSection('Instructions:', instructions),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<String> content) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: content
                .map((item) => Text(
                      '- $item',
                      style: const TextStyle(fontSize: 16.0),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
