import 'package:cantiques/_models/cantique.langue.model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CantiqueLangueService {
  Future<List<CantiqueLangue>> getAll() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final querySnapshot = await db.collection("cantique-langue").get();

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
}
