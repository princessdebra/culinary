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
      home: AppetizersScreen(),
    );
  }
}

class AppetizersScreen extends StatelessWidget {
  final List<Map<String, dynamic>> appetizers = [
    {
      'title': 'Spinach Artichoke Dip',
      'image': 'assets/images/spinach.jpg',
      'ingredients': [
        '1. Cream cheese',
        '2. Sour cream',
        '3. Mayonnaise',
        '4. Garlic',
        '5. Parmesan',
      ],
      'instructions': [
        '1. Preheat oven to 350 degrees.',
        '2. Spray a small (4 – 5 cup) baking dish with non-stick cooking spray.',
        '3. In a mixing bowl stir together cream cheese, sour cream, mayonnaise, garlic, parmesan, mozzarella and pepper.',
        '4. Stir in artichokes and spinach.'
      ]
    },
    {
      'title': 'Bruschetta',
      'image': 'assets/images/bruschetta.jpg',
      'ingredients': [
        '1. Extra virgin olive oil',
        '2. Minced fresh garlic',
        '3. Roma tomatoes ',
        '4. Balsamic vinegar ',
        '5. Kosher salt'
      ],
      'instructions': [
        '1.For tomato mixture: Heat olive oil in a small skillet or saucepan, add garlic and saute until just starting to turn golden.',
        '2. Pour into a large mixing bowl and let cool while you chop the tomatoes and basil.',
        '3. Pour tomatoes into the bowl with cooled oil mixture. Add parmesan, basil, balsamic vinegar, salt, and pepper. Toss mixture well. Serve right away over toasted bread and garnish with more parmesan if desired.',
        '4. To toast bread: Align bread slices on an 18-by-13-inch baking sheet. Broil the first side until golden brown, then flip slices to the opposite side and broil opposite side until golden brown.'
      ]
    },
    {
      'title': 'Stuffed Mushrooms',
      'image': 'assets/images/mushrooms.jpg',
      'ingredients': [
        '1. Mushrooms',
        '2. Olive oil cooking spray',
        '3. Frozen spinach',
        '4. Cream cheese',
        '5. Parmesan cheese'
      ],
      'instructions': [
        '1. Preheat oven prepare baking sheet: Preheat oven to 400 degrees. Optionally you can line a baking sheet with aluminum foil for easier clean up.',
        '2. Drain spinach very well: Place spinach on several layer of paper towels, spread it out a little then fold paper towels over and squeeze most of the excess moisture from spinach. Place in a medium mixing bowl.',
        '3. Stuff mushrooms: Scoop out a spoonful at a time and stuff into mushroom caps. Set on baking sheet, filling upright.',
        '4. Oil mushrooms: Place mushroom caps on a baking sheet and spray top and bottom sides with non-stick cooking spray.'
      ]
    },
  ];

  AppetizersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appetizers'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bacc.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: appetizers.length,
          itemBuilder: (context, index) {
            return AppetizerCard(
              title: appetizers[index]['title']!,
              image: appetizers[index]['image']!,
              ingredients:
                  List<String>.from(appetizers[index]['ingredients'] as List),
              instructions:
                  List<String>.from(appetizers[index]['instructions'] as List),
            );
          },
        ),
      ),
    );
  }
}

class AppetizerCard extends StatelessWidget {
  final String title;
  final String image;
  final List<String> ingredients;
  final List<String> instructions;

  const AppetizerCard({
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
            _buildSection('Ingredients:', _formatList(ingredients)),
            _buildSection('Instructions:', _formatList(instructions)),
          ],
        ),
      ),
    );
  }

  static List<Widget> _formatList(List<String> items) {
    return items
        .map(
          (item) => Text(
            item,
            style: const TextStyle(
              fontSize: 16.0,
              fontStyle: FontStyle.italic,
            ),
          ),
        )
        .toList();
  }

  Widget _buildSection(String title, List<Widget> content) {
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
            children: content,
          ),
        ],
      ),
    );
  }
}
