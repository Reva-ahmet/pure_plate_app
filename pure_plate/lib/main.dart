import 'package:flutter/material.dart';

void main() {
  runApp(const PurePlateApp());
}

class PurePlateApp extends StatelessWidget {
  const PurePlateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PurePlate',
      theme: ThemeData(useMaterial3: true),
      home: const SplashScreen(),
    );
  }
}

// --- SCREEN 1: SPLASH SCREEN ---
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3E7065),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.restaurant, size: 100, color: Colors.white),
            const SizedBox(height: 20),
            const Text(
              'PUREPLATE',
              style: TextStyle(
                color: Colors.white,
                fontSize: 48,
                fontWeight: FontWeight.bold,
                fontFamily: 'Serif',
              ),
            ),
            const SizedBox(height: 150),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RecipeListScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFBCCECB),
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              child: const Text(
                'Explore Recipes',
                style: TextStyle(color: Color(0xFF3E7065), fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- SCREEN 2: RECIPE LIST SCREEN ---
class RecipeListScreen extends StatelessWidget {
  const RecipeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3E7065),
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'HEALTHY RECIPES',
                style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView(
                children: const [
                  RecipeCard(
                    title: 'AVOCADO TOAST WITH EGG',
                    ingredients: ['1 slice Whole Wheat Bread', 'Half an Avocado', '1 Poached Egg', 'Chili Flakes'],
                    instructions: '1. Toast the bread.\n2. Mash avocado with salt.\n3. Top with a poached egg and spices.',
                  ),
                  RecipeCard(
                    title: 'CHICKEN CAESAR SALAD',
                    ingredients: ['2 cups Romaine Lettuce', '1 Grilled Chicken Breast', 'Parmesan Cheese', 'Croutons'],
                    instructions: '1. Chop the lettuce.\n2. Slice grilled chicken.\n3. Toss with dressing and top with cheese.',
                  ),
                  RecipeCard(
                    title: 'PROTEIN POWER BOWL',
                    ingredients: ['1/2 cup Quinoa', 'Black Beans', 'Roasted Sweet Potato', 'Spinach'],
                    instructions: '1. Cook quinoa.\n2. Mix all ingredients in a bowl.\n3. Add tahini dressing on top.',
                  ),
                  RecipeCard(
                    title: 'GREEK YOGURT PARFAIT',
                    ingredients: ['1 cup Greek Yogurt', 'Fresh Berries', 'Granola', 'Honey'],
                    instructions: '1. Layer yogurt and berries.\n2. Sprinkle granola on top.\n3. Drizzle with honey.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- SCREEN 3: RECIPE DETAIL SCREEN ---
class RecipeDetailScreen extends StatelessWidget {
  final String title;
  final List<String> ingredients;
  final String instructions;

  const RecipeDetailScreen({
    super.key,
    required this.title,
    required this.ingredients,
    required this.instructions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3E7065),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 80,
              backgroundColor: Colors.white24,
              child: Icon(Icons.restaurant_menu, size: 60, color: Colors.white),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('INGREDIENTS', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      ...ingredients.map((item) => _bulletPoint(item)).toList(),
                      const SizedBox(height: 30),
                      const Text('INSTRUCTIONS', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      Text(instructions, style: const TextStyle(color: Colors.white, fontSize: 16)),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFBCCECB), shape: const StadiumBorder()),
                child: const Text('Back to List', style: TextStyle(color: Color(0xFF3E7065))),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(children: [
        const Text('• ', style: TextStyle(color: Colors.white, fontSize: 18)),
        Expanded(child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 16))),
      ]),
    );
  }
}

// --- COMPONENT: UPDATED RECIPE CARD ---
class RecipeCard extends StatelessWidget {
  final String title;
  final List<String> ingredients;
  final String instructions;

  const RecipeCard({
    super.key,
    required this.title,
    required this.ingredients,
    required this.instructions,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Now when you tap, it passes the unique data to the detail screen!
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipeDetailScreen(
              title: title,
              ingredients: ingredients,
              instructions: instructions,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: const Color(0xFFBCCECB),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 35,
              backgroundColor: Colors.white,
              child: Icon(Icons.fastfood, color: Color(0xFF3E7065)),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF3E7065)),
              ),
            ),
            const Icon(Icons.play_arrow_rounded, size: 30, color: Colors.black54),
          ],
        ),
      ),
    );
  }
}