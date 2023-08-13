import 'package:cantiques/_models/cantique.version.model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:localstorage/localstorage.dart';
import '../_models/cantique.model.dart';

class CantiqueService {
  final LocalStorage storage = new LocalStorage('cantiques.json');

  Future<List<Cantique>> getAll() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final querySnapshot = await db.collection("cantiques").get();

    List<Cantique> cantiques = [];
    // List<dynamic> cantiquesMap = await parseJsonFromAssets('assets/json/cantiques.json');
    List<dynamic> cantiquesMap = [];

    for (var docSnapshot in querySnapshot.docs) {
      print('${docSnapshot.id} => ${docSnapshot.data()}');
      cantiquesMap.add(docSnapshot.data());
    }

    print("cantiquesMap");
    print(cantiquesMap);
    cantiquesMap.forEach((cantiqueMap) {
      print(cantiqueMap);
      cantiques.add(Cantique.fromJSON(cantiqueMap));
      print("cantiques.length");
      print(cantiques.length);
    });
    return cantiques;
  }

  Future<List<Cantique>> getAllByLangue(String codeLangue) async {
    List<Cantique> cantiques = await getAll();
    return cantiques.where((cantique) {
      return cantique.versions.map((version) => version.langue.code).contains(codeLangue);
    }).toList();
  }

  Future<dynamic> parseJsonFromAssets(String assetsPath) async {
    print('--- Parse json from: $assetsPath');
    dynamic jsonStr = await rootBundle.loadString(assetsPath);
    print("jsonStr");
    print(jsonStr);
    return jsonDecode(jsonStr);
  }

  addToFavoris(Cantique cantique) {
    List<dynamic> cantiquesJSON = storage.getItem('favoris') ?? [];
    cantiquesJSON.add(cantique.toJSON());
    storage.setItem("favoris", cantiquesJSON);
  }

  retirerFavoris(Cantique cantique) {
    List<dynamic> cantiquesJSONNouveaux = [];
    List<dynamic> cantiquesJSON = storage.getItem('favoris') ?? [];
    cantiquesJSON.forEach((c) {
      if (c['id'] != cantique.id) {
        cantiquesJSONNouveaux.add(c);
      }
    });
    storage.setItem("favoris", cantiquesJSONNouveaux);
  }

  List<Cantique> getFavoris() {
    List<dynamic> cantiquesJSON = storage.getItem('favoris') ?? [];
    List<Cantique> cantiques = [];
    cantiquesJSON.forEach((json) {
      cantiques.add(Cantique.fromJSON(json));
    });
    return cantiques;
  }

  bool isFavoris(Cantique cantique) {
    bool resultat = false;
    List<dynamic> cantiquesJSON = storage.getItem('favoris') ?? [];
    print('favoris');
    print(cantiquesJSON);
    cantiquesJSON.forEach((c) {
      if (c['id'] == cantique.id) {
        resultat = true;
      }
    });
    return resultat;
  }
}
