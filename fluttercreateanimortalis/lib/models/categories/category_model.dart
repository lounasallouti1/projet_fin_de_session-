class Category {
  final String title;
  final String icon;
  final String description;
  final List<Animal> animals;

  Category({
    required this.title,
    required this.icon,
    required this.description,
    required this.animals,
  });
}

class Animal {
  final String name;
  final String image;
  final String description;

  Animal({required this.name, required this.image, required this.description});
}

class CategoryModel {
  final String id;
  final String nom;
  final String image;
  final String description;

  CategoryModel({
    required this.id,
    required this.nom,
    required this.image,
    required this.description,
  });
}
