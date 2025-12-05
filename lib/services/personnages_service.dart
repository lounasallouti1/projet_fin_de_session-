import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/personnage_model.dart';

class PersonnagesService {
  Future<List<Personnage>> loadPersonnages() async {
    final String jsonString = await rootBundle.loadString(
      'assets/data/personnages.json',
    );

    final List<dynamic> rawList = json.decode(jsonString);

    return rawList.map((jsonItem) => Personnage.fromJson(jsonItem)).toList();
  }
}
