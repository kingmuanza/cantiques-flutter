import 'package:cloud_firestore/cloud_firestore.dart';

import '../_models/compositeur.model.dart';

class CompositeurService {
  Future<List<Compositeur>> getAll() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final querySnapshot = await db.collection("compositeurs").get();

    List<Compositeur> compositeurs = [];
    // List<dynamic> cantiquesMap = await parseJsonFromAssets('assets/json/cantiques.json');
    List<dynamic> cantiquesMap = [];

    for (var docSnapshot in querySnapshot.docs) {
      cantiquesMap.add(docSnapshot.data());
    }

    cantiquesMap.forEach((cantiqueMap) {
      compositeurs.add(Compositeur.fromJSON(cantiqueMap));
    });

    return compositeurs;
  }
}
