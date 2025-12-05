import 'package:flutter/material.dart';
import 'mammiferes_page.dart';

class WarmFamiliesPage extends StatelessWidget {
  const WarmFamiliesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final families = [
      {"title": "Mammifères", "image": "assets/images/mammiferes.png"},
      {"title": "Oiseaux", "image": "assets/images/oiseaux.png"},
      {"title": "Poissons", "image": "assets/images/poissons.png"},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFDDE8C4),

      appBar: AppBar(
        backgroundColor: const Color(0xFFDDE8C4),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Animaux à sang chaud",
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

            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
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
                      if (constraints.maxWidth > 700) count = 3;

                      return GridView.builder(
                        itemCount: families.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: count,
                          childAspectRatio: 0.85,
                          crossAxisSpacing: 30,
                          mainAxisSpacing: 30,
                        ),

                        itemBuilder: (context, index) {
                          final fam = families[index];

                          return GestureDetector(
                            onTap: () {
                              if (fam["title"] == "Mammifères") {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const MammiferesPage(),
                                  ),
                                );
                              }

                              if (fam["title"] == "Oiseaux") {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "Page Oiseaux pas encore créée 👀",
                                    ),
                                  ),
                                );
                              }

                              if (fam["title"] == "Poissons") {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "Page Poissons bientôt disponible 🐟",
                                    ),
                                  ),
                                );
                              }
                            },

                            child: Column(
                              children: [
                                Container(
                                  width: 120,
                                  height: 120,
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
                                      fam["image"]!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 12),

                                Text(
                                  fam["title"]!,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
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
    );
  }
}
