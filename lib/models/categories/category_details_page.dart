import 'package:flutter/material.dart';
import 'category_model.dart';

class CategoryDetailsPage extends StatelessWidget {
  final CategoryModel category;

  const CategoryDetailsPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(category.nom),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: category.id,
              child: Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Colors.deepPurple.shade200,
                      Colors.deepPurple.shade400,
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Image.asset(category.image),
                ),
              ),
            ),

            const SizedBox(height: 30),

            Text(
              category.nom,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              category.description,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18, height: 1.6),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                "Voir les personnages",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
