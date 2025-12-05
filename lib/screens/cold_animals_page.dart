import 'package:flutter/material.dart';
import 'cold_animal_details_page.dart';

class ColdAnimalsPage extends StatelessWidget {
  const ColdAnimalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final animals = [
      {
        "name": "Serpent",
        "image": "assets/images/serpent.png",
        "habitat": "Déserts, jungles, forêts",
        "diet": "Carnivore",
        "info":
            "Les serpents régulent leur température selon leur environnement.",
      },
      {
        "name": "Crocodile",
        "image": "assets/images/crocodile.png",
        "habitat": "Marécages, rivières",
        "diet": "Carnivore",
        "info": "Le crocodile est un reptile à sang froid très puissant.",
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFDDE8C4),
      appBar: AppBar(
        backgroundColor: const Color(0xFFDDE8C4),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Animaux à sang froid",
          style: TextStyle(
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

      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: GridView.builder(
              itemCount: animals.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 30,
                mainAxisSpacing: 30,
                childAspectRatio: 0.85,
              ),
              itemBuilder: (context, index) {
                final animal = animals[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ColdAnimalDetailsPage(
                          name: animal["name"]!,
                          image: animal["image"]!,
                          habitat: animal["habitat"]!,
                          diet: animal["diet"]!,
                          info: animal["info"]!,
                        ),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 8,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            animal["image"]!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        animal["name"]!,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
