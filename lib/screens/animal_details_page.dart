import 'package:flutter/material.dart';

class AnimalDetailsPage extends StatelessWidget {
  final String name;
  final String image;
  final String habitat;
  final String diet;
  final String fact;

  const AnimalDetailsPage({
    super.key,
    required this.name,
    required this.image,
    required this.habitat,
    required this.diet,
    required this.fact,
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
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  image,
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 25),

              infoCard(
                "Description",
                "$name est un animal fascinant. "
                    "Il joue un rôle important dans son écosystème. "
                    "Découvrez ci-dessous ses principales caractéristiques.",
              ),

              const SizedBox(height: 15),

              infoCard("Habitat", habitat),

              infoCard("Alimentation", diet),

              infoCard("Poids", _getWeight(name)),

              infoCard("Taille", _getSize(name)),

              infoCard("Durée de vie", _getLifeSpan(name)),

              infoCard("Fait intéressant", fact),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget infoCard(String title, String content) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(18),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
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
          Text(content, style: const TextStyle(fontSize: 15, height: 1.4)),
        ],
      ),
    );
  }

  String _getWeight(String animal) {
    switch (animal) {
      case "Lion":
        return "150 à 250 kg";
      case "Chien":
        return "5 à 50 kg (selon la race)";
      case "Chat":
        return "3 à 5 kg";
      case "Éléphant":
        return "2 500 à 6 000 kg";
      case "Lapin":
        return "1 à 2 kg";
      default:
        return "Inconnu";
    }
  }

  String _getSize(String animal) {
    switch (animal) {
      case "Lion":
        return "1,2 m au garrot, jusqu'à 2,5 m de long";
      case "Chien":
        return "20 à 70 cm (selon la race)";
      case "Chat":
        return "23 à 25 cm de hauteur";
      case "Éléphant":
        return "3 m de hauteur";
      case "Lapin":
        return "35 à 50 cm de long";
      default:
        return "Inconnu";
    }
  }

  String _getLifeSpan(String animal) {
    switch (animal) {
      case "Lion":
        return "12 à 16 ans";
      case "Chien":
        return "10 à 15 ans";
      case "Chat":
        return "12 à 18 ans";
      case "Éléphant":
        return "50 à 70 ans";
      case "Lapin":
        return "8 à 12 ans";
      default:
        return "Inconnue";
    }
  }
}
