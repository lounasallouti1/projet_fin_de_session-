import 'package:flutter/material.dart';
import 'animal_details_page.dart';

class MammiferesPage extends StatelessWidget {
  const MammiferesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final animals = [
      {
        "name": "Lion",
        "image": "assets/images/lion.png",
        "habitat": "Savane africaine",
        "diet": "Carnivore",
        "fact": "Son rugissement peut s’entendre à 8 km.",
      },
      {
        "name": "Chien",
        "image": "assets/images/chien.png",
        "habitat": "Partout dans le monde",
        "diet": "Omnivore",
        "fact": "Premier animal domestiqué par l’humain.",
      },
      {
        "name": "Chat",
        "image": "assets/images/chat.png",
        "habitat": "Maisons, rues, campagnes",
        "diet": "Carnivore",
        "fact": "Peut dormir jusqu’à 16 heures par jour.",
      },
      {
        "name": "Éléphant",
        "image": "assets/images/elephant.png",
        "habitat": "Savane et forêts tropicales",
        "diet": "Herbivore",
        "fact": "Plus grand animal terrestre.",
      },
      {
        "name": "Lapin",
        "image": "assets/images/lapin.png",
        "habitat": "Prairies, jardins, forêts",
        "diet": "Herbivore",
        "fact": "Ses dents poussent toute sa vie.",
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFDDE8C4),
      appBar: AppBar(
        backgroundColor: const Color(0xFFDDE8C4),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Mammifères",
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
                        builder: (_) => AnimalDetailsPage(
                          name: animal["name"]!,
                          image: animal["image"]!,
                          habitat: animal["habitat"]!,
                          diet: animal["diet"]!,
                          fact: animal["fact"]!,
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
