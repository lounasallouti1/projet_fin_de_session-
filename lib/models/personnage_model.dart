class Personnage {
  final String nom;
  final String classe;
  final int niveau;
  final String image;

  Personnage({
    required this.nom,
    required this.classe,
    required this.niveau,
    required this.image,
  });

  factory Personnage.fromJson(Map<String, dynamic> json) {
    return Personnage(
      nom: json['nom'],
      classe: json['classe'],
      niveau: json['niveau'],
      image: json['image'],
    );
  }
}
