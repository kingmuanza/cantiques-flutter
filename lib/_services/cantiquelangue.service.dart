import 'package:cantiques/_models/cantique.langue.model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../_models/langue.model.dart';

class CantiqueLangueService {
  Future<List<CantiqueLangue>> getAll() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final querySnapshot = await db.collection("cantique-langue").where("identifiantglobal", isNotEqualTo: "").get();

    List<CantiqueLangue> cantiques = [];
    // List<dynamic> cantiquesMap = await parseJsonFromAssets('assets/json/cantiques.json');
    List<dynamic> cantiquesMap = [];

    for (var docSnapshot in querySnapshot.docs) {
      cantiquesMap.add(docSnapshot.data());
    }

    cantiquesMap.forEach((cantiqueMap) {
      cantiques.add(CantiqueLangue.fromJSON(cantiqueMap));
    });
    cantiques.sort(
      (a, b) {
        double premier = double.parse(a.identifiantglobal);
        double second = double.parse(b.identifiantglobal);
        print(premier.toString() + ", " + second.toString());
        return premier >= second ? 1 : -1;
      },
    );
    return cantiques;
  }

  Future<List<CantiqueLangue>> getAllByLangue(Langue langue) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final querySnapshot =
        await db.collection("cantique-langue").where("langue.id", isEqualTo: langue.id).where("identifiantglobal", isNotEqualTo: "").get();

    List<CantiqueLangue> cantiques = [];
    // List<dynamic> cantiquesMap = await parseJsonFromAssets('assets/json/cantiques.json');
    List<dynamic> cantiquesMap = [];

    for (var docSnapshot in querySnapshot.docs) {
      cantiquesMap.add(docSnapshot.data());
    }

    cantiquesMap.forEach((cantiqueMap) {
      cantiques.add(CantiqueLangue.fromJSON(cantiqueMap));
    });
    cantiques.sort(
      (a, b) {
        int premier = int.parse(a.identifiantglobal);
        int second = int.parse(b.identifiantglobal);
        print(premier.toString() + ", " + second.toString());
        return premier >= second ? -1 : 1;
      },
    );
    return cantiques;
  }

  Future<List<CantiqueLangue>> getAllByIdentifiant(String identifiantglobal) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final querySnapshot = await db
        .collection("cantique-langue")
        .where("identifiantglobal", isEqualTo: identifiantglobal)
        .where("identifiantglobal", isNotEqualTo: "")
        .get();

    List<CantiqueLangue> cantiques = [];
    // List<dynamic> cantiquesMap = await parseJsonFromAssets('assets/json/cantiques.json');
    List<dynamic> cantiquesMap = [];

    for (var docSnapshot in querySnapshot.docs) {
      cantiquesMap.add(docSnapshot.data());
    }

    cantiquesMap.forEach((cantiqueMap) {
      cantiques.add(CantiqueLangue.fromJSON(cantiqueMap));
    });
    cantiques.sort(
      (a, b) {
        int premier = int.parse(a.identifiantglobal);
        int second = int.parse(b.identifiantglobal);
        print(premier.toString() + ", " + second.toString());
        return premier >= second ? -1 : 1;
      },
    );
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
        final querySnapshot = await db.collection("cantique-langue").where("refs." + key, isEqualTo: cantique.refs[key]).get();
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

  CantiqueLangue formatCantiqueLangue(CantiqueLangue cantique) {
    if (cantique.langue.code == "ANG") {
      int indexOfRefrain = cantique.brut.indexOf("Refrain");
      if (indexOfRefrain != -1) {
        String premierCouplet = cantique.brut.substring(0, indexOfRefrain - 1);
        String reste = cantique.brut.substring(indexOfRefrain);
        int indexOfDeuxiemeCouplet = reste.indexOf("2");
        String refrain = reste.substring(0, indexOfDeuxiemeCouplet);
        reste = reste.substring(indexOfDeuxiemeCouplet);
        cantique.couplets = [
          premierCouplet,
          reste,
        ];
        cantique.refrain = refrain;
      }
    } else {
      cantique.couplets = [cantique.brut.replaceAll(cantique.references, ""), cantique.references];
    }
    return cantique;
  }
}
