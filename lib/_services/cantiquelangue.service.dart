import 'package:cantiques/_models/cantique.langue.model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../_models/langue.model.dart';

class CantiqueLangueService {
  Future<List<CantiqueLangue>> getAll() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final querySnapshot = await db.collection("cantique-langue").limit(100).get();

    List<CantiqueLangue> cantiques = [];
    // List<dynamic> cantiquesMap = await parseJsonFromAssets('assets/json/cantiques.json');
    List<dynamic> cantiquesMap = [];

    for (var docSnapshot in querySnapshot.docs) {
      cantiquesMap.add(docSnapshot.data());
    }

    cantiquesMap.forEach((cantiqueMap) {
      cantiques.add(CantiqueLangue.fromJSON(cantiqueMap));
    });
    return cantiques;
  }

  Future<List<CantiqueLangue>> getAllByLangue(Langue langue) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final querySnapshot = await db.collection("cantique-langue").where("langue.id", isEqualTo: langue.id).get();

    List<CantiqueLangue> cantiques = [];
    // List<dynamic> cantiquesMap = await parseJsonFromAssets('assets/json/cantiques.json');
    List<dynamic> cantiquesMap = [];

    for (var docSnapshot in querySnapshot.docs) {
      cantiquesMap.add(docSnapshot.data());
    }

    cantiquesMap.forEach((cantiqueMap) {
      cantiques.add(CantiqueLangue.fromJSON(cantiqueMap));
    });
    return cantiques;
  }

  Future<List<CantiqueLangue>> getAllCantiqueInOthersLangues(CantiqueLangue cantique) async {
    print("getAllCantiqueInOthersLangues");
    FirebaseFirestore db = FirebaseFirestore.instance;
    List<CantiqueLangue> cantiques = [];
    List<dynamic> cantiquesMap = [];

    dynamic keys = cantique.refs.keys;
    List<String> dejas = [];

    for (var key in cantique.refs.keys) {
      if (cantique.refs[key] != 0) {
        final querySnapshot = await db.collection("cantique-langue").where("refs." + key, isEqualTo: cantique.refs[key]).limit(100).get();
        for (var docSnapshot in querySnapshot.docs) {
          cantiquesMap.add(docSnapshot.data());
        }
        cantiquesMap.forEach((cantiqueMap) {
          CantiqueLangue cantiqueLangue = CantiqueLangue.fromJSON(cantiqueMap);
          if (cantiqueLangue.id != cantique.id && !dejas.contains(cantiqueLangue.id)) {
            cantiques.add(cantiqueLangue);
            dejas.add(cantiqueLangue.id);
          }
        });
      }
    }

    return cantiques;
  }
}
