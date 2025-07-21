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
      home: SaladsScreen(),
    );
  }
}

class SaladsScreen extends StatelessWidget {
  final List<Map<String, String>> salads = [
    {
      'title': 'Caesar Salad',
      'image': 'assets/images/caesar.jpg',
      'ingredients':
          '1. Romaine Lettuce, 2. Croutons, 3. Parmesan Cheese, 4. Caesar Dressing',
      'instructions':
          'Toss lettuce with dressing, top with croutons and cheese.',
    },
    {
      'title': 'Greek Salad',
      'image': 'assets/images/Greek.jpg',
      'ingredients':
          '1. Cucumbers, 2. Tomatoes, 3. Red Onion, 4. Feta Cheese, 5. Olives, 6. Olive Oil, 7. Lemon Juice',
      'instructions':
          'Chop vegetables, mix with cheese and olives, dress with oil and lemon juice.',
    },
    // Add more salad recipes
  ];

  SaladsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Salads'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bacc.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: salads.length,
          itemBuilder: (context, index) {
            return SaladsCard(
              title: salads[index]['title']!,
              image: salads[index]['image']!,
              ingredients: salads[index]['ingredients']!,
              instructions: salads[index]['instructions']!,
            );
          },
        ),
      ),
    );
  }
}

class SaladsCard extends StatelessWidget {
  final String title;
  final String image;
  final String ingredients;
  final String instructions;

  const SaladsCard(
      {super.key,
      required this.title,
      required this.image,
      required this.ingredients,
      required this.instructions});

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
  final String ingredients;
  final String instructions;

  const RecipePage(
      {super.key,
      required this.title,
      required this.image,
      required this.ingredients,
      required this.instructions});

  @override
  Widget build(BuildContext context) {
    List<String> ingredientList = ingredients.split(', ');
    List<String> instructionList = instructions.split('\n');

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
            _buildSection('Ingredients:', ingredientList),
            _buildSection('Instructions:', instructionList),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<String> contentList) {
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
            children: contentList.map((content) {
              return Text(
                content.trim(),
                style: const TextStyle(
                  fontSize: 16.0,
                  fontStyle: FontStyle.italic,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
