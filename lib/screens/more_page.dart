import 'package:flutter/material.dart';



class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> with TickerProviderStateMixin {
  // ⚡ Liste PRO des catégories
  final List<Map<String, dynamic>> categories = [
    {
      "nom": "Mammifères",
      "icon": Icons.pets,
      "color": Colors.pinkAccent,
      "desc":
          "Les mammifères sont des animaux vertébrés caractérisés par la présence de poils et l’allaitement.",
    },
    {
      "nom": "Oiseaux",
      "icon": Icons.flight,
      "color": Colors.lightBlueAccent,
      "desc":
          "Les oiseaux sont des animaux à plumes capables de voler, pondant des œufs.",
    },
    {
      "nom": "Reptiles",
      "icon": Icons.auto_awesome,
      "color": Colors.deepPurpleAccent,
      "desc":
          "Les reptiles sont des animaux à sang froid recouverts d’écailles.",
    },
    {
      "nom": "Amphibiens",
      "icon": Icons.spa,
      "color": Colors.greenAccent,
      "desc":
          "Les amphibiens vivent entre l’eau et la terre et possèdent une peau perméable.",
    },
    {
      "nom": "Poissons",
      "icon": Icons.waves,
      "color": Colors.cyanAccent,
      "desc":
          "Les poissons respirent grâce à des branchies et vivent exclusivement dans l’eau.",
    },
    {
      "nom": "Mollusques",
      "icon": Icons.water,
      "color": Colors.yellowAccent,
      "desc":
          "Les mollusques sont des animaux au corps mou, parfois protégés par une coquille.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text("Catégories"),
      ),

      // ======= CONTENU ======================================
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Explore les catégories",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),

            const SizedBox(height: 20),

            // ===== LISTE HORIZONTALE DES ICONES ======
            SizedBox(
              height: 120,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                separatorBuilder: (_, __) => const SizedBox(width: 18),
                itemBuilder: (context, index) {
                  final item = categories[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: const Duration(milliseconds: 600),
                          reverseTransitionDuration: const Duration(
                            milliseconds: 400,
                          ),
                          pageBuilder: (_, animation, secondaryAnimation) =>
                              FadeTransition(
                                opacity: animation,
                                child: CategoryDetails(item: item),
                              ),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Hero(
                          tag: "icon_${item['nom']}",
                          child: CircleAvatar(
                            radius: 35,
                            backgroundColor: item["color"].withOpacity(0.3),
                            child: Icon(
                              item["icon"],
                              size: 32,
                              color: Colors.deepPurple,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(item["nom"], style: const TextStyle(fontSize: 14)),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 40),

            const Text(
              "Informations",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),

            const SizedBox(height: 40),

            const Center(
              child: Text(
                "Sélectionne une catégorie pour voir les détails.",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ======================================================
///    PAGE DE DETAILS — AVEC HERO + DESIGN COMPLET
/// ======================================================

class CategoryDetails extends StatelessWidget {
  final Map<String, dynamic> item;

  const CategoryDetails({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: item["color"].withOpacity(0.1),
      appBar: AppBar(backgroundColor: item["color"], title: Text(item["nom"])),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Hero(
              tag: "icon_${item['nom']}",
              child: CircleAvatar(
                radius: 60,
                backgroundColor: item["color"].withOpacity(0.3),
                child: Icon(item["icon"], size: 70, color: Colors.deepPurple),
              ),
            ),

            const SizedBox(height: 30),

            Text(
              item["nom"],
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            Text(
              item["desc"],
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20),
            ),

            const Spacer(),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: item["color"],
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              onPressed: () {},
              child: const Text(
                "Voir les animaux",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
