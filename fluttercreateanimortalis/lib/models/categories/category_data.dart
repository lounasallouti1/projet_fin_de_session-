import 'category_model.dart';

List<Category> categories = [
  Category(
    title: "Mammifères",
    icon: "assets/icons/mammiferes.png",
    description:
        "Les mammifères sont caractérisés par la présence de poils et l’allaitement.",
    animals: [
      Animal(
        name: "Lion",
        image: "assets/images/lion.png",
        description: "Le roi de la savane.",
      ),
      Animal(
        name: "Tigre",
        image: "assets/images/tigre.png",
        description: "Un félin puissant.",
      ),
    ],
  ),

  Category(
    title: "Oiseaux",
    icon: "assets/icons/oiseaux.png",
    description: "Les oiseaux sont des animaux à plumes capables de voler.",
    animals: [
      Animal(
        name: "Aigle",
        image: "assets/images/aigle.png",
        description: "Un prédateur aérien.",
      ),
    ],
  ),
];
