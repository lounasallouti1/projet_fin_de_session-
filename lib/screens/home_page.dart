import 'package:flutter/material.dart';
import '../models/animal.dart';
import 'details_page.dart';
import 'warm_families_page.dart';
import 'cold_animals_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  bool showCard = false;
  Map<String, String> selectedCategory = {};

  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _slideAnimation = Tween(
      begin: const Offset(0, 1),
      end: const Offset(0, 0),
    ).animate(_controller);

    _fadeAnimation = Tween(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Animal> _animalsForCategory(String title) {
    if (title == "Animaux à sang chaud") {
      return const [
        Animal(
          name: "Lion",
          habitat: "Savane africaine",
          diet: "Carnivore",
          funFact: "Son rugissement s’entend jusqu’à 8 km.",
        ),
        Animal(
          name: "Chien",
          habitat: "Partout dans le monde",
          diet: "Omnivore",
          funFact: "Premier animal domestiqué par l’humain.",
        ),
        Animal(
          name: "Chat",
          habitat: "Villes et campagnes",
          diet: "Carnivore",
          funFact: "Peut dormir jusqu’à 16 heures par jour.",
        ),
      ];
    }

    if (title == "Animaux à sang froid") {
      return const [
        Animal(
          name: "Serpent",
          habitat: "Forêts, déserts, jungles",
          diet: "Carnivore",
          funFact: "Avalent parfois des proies plus grosses que leur tête.",
        ),
        Animal(
          name: "Crocodile",
          habitat: "Rivières et marais tropicaux",
          diet: "Carnivore",
          funFact: "Peut rester plusieurs heures immobile dans l’eau.",
        ),
      ];
    }

    return const [
      Animal(
        name: "Grenouille",
        habitat: "Zones humides",
        diet: "Insectivore",
        funFact: "Respire aussi à travers sa peau.",
      ),
      Animal(
        name: "Salamandre",
        habitat: "Forêts humides",
        diet: "Insectivore",
        funFact: "Peut régénérer ses membres.",
      ),
    ];
  }

  void openCard(Map<String, String> category) {
    setState(() {
      selectedCategory = category;
      showCard = true;
    });
    _controller.forward();
  }

  void closeCard() {
    _controller.reverse().then((_) {
      setState(() {
        showCard = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final categories = [
      {
        "title": "Animaux à sang chaud",
        "image": "assets/icons/hot.png",
        "description":
            "Température du corps presque constante, même si la météo change.",
      },
      {
        "title": "Animaux à sang froid",
        "image": "assets/icons/cold.png",
        "description":
            "Température corporelle dépendante du climat : soleil, ombre, eau froide ou chaude.",
      },
      {
        "title": "Animaux à sang varié",
        "image": "assets/icons/mixed.png",
        "description":
            "Température adaptable selon les conditions environnementales.",
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFDDE8C4),

      appBar: AppBar(
        backgroundColor: const Color(0xFFDDE8C4),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Animortalis",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),

      body: Stack(
        children: [
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: "Rechercher...",
                          prefixIcon: Icon(Icons.search),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 15),
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),

                    Expanded(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          int count = 2;
                          if (constraints.maxWidth > 750) count = 3;

                          return GridView.builder(
                            itemCount: categories.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: count,
                                  childAspectRatio: 0.85,
                                  crossAxisSpacing: 30,
                                  mainAxisSpacing: 30,
                                ),
                            itemBuilder: (context, index) {
                              final cat = categories[index];
                              return GestureDetector(
                                onTap: () => openCard(cat),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(20),
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
                                      child: Image.asset(
                                        cat["image"]!,
                                        height: 60,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      cat["title"]!,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          if (showCard)
            GestureDetector(
              onTap: closeCard,
              child: Container(color: Colors.black.withOpacity(0.2)),
            ),

          if (showCard)
            SlideTransition(
              position: _slideAnimation,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 310,
                    width: double.infinity,
                    padding: const EdgeInsets.all(22),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 20,
                          offset: Offset(0, -5),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.orangeAccent.withOpacity(0.2),
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                selectedCategory["image"]!,
                                height: 32,
                              ),
                            ),
                            const SizedBox(width: 15),

                            Expanded(
                              child: Text(
                                selectedCategory["title"] ?? "",
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            IconButton(
                              onPressed: closeCard,
                              icon: const Icon(Icons.close),
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),

                        Container(
                          height: 2,
                          width: double.infinity,
                          color: Colors.black12,
                        ),

                        const SizedBox(height: 15),

                        Text(
                          selectedCategory["description"] ?? "",
                          style: const TextStyle(
                            fontSize: 15,
                            height: 1.5,
                            color: Colors.black87,
                          ),
                        ),

                        const Spacer(),

                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orangeAccent,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            onPressed: () {
                              final title = selectedCategory["title"] ?? "";

                              if (title == "Animaux à sang chaud") {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const WarmFamiliesPage(),
                                  ),
                                );
                              } else if (title == "Animaux à sang froid") {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const ColdAnimalsPage(),
                                  ),
                                );
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => DetailsPage(
                                      categoryTitle: title,
                                      categoryDescription:
                                          selectedCategory["description"] ?? "",
                                      animals: _animalsForCategory(title),
                                    ),
                                  ),
                                );
                              }
                            },
                            child: const Text(
                              "Voir plus",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
