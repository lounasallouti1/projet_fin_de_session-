import 'package:flutter/material.dart';
import 'category_model.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel item;

  const CategoryCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.deepPurple.shade200,
            Colors.deepPurple.shade400,
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(item.image, width: 60),
          const SizedBox(height: 10),
          Text(
            item.nom,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
