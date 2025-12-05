import 'package:flutter/material.dart';

class ColdAnimalDetailsPage extends StatelessWidget {
  final String name;
  final String image;
  final String habitat;
  final String diet;
  final String info;

  const ColdAnimalDetailsPage({
    super.key,
    required this.name,
    required this.image,
    required this.habitat,
    required this.diet,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDDE8C4),
      appBar: AppBar(
        backgroundColor: const Color(0xFFDDE8C4),
        elevation: 0,
        centerTitle: true,
        title: Text(
          name,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset(
                  image,
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            infoCard("Habitat", habitat),
            infoCard("Alimentation", diet),
            infoCard("À savoir", info),
          ],
        ),
      ),
    );
  }

  Widget infoCard(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Container(
        padding: const EdgeInsets.all(20),
        width: 320,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(content, style: const TextStyle(fontSize: 15)),
          ],
        ),
      ),
    );
  }
}
