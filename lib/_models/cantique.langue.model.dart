import 'package:cantiques/_models/compositeur.model.dart';
import 'package:cantiques/_models/langue.model.dart';

class CantiqueLangue {
  String id = "";
  Langue langue = Langue();
  String titre = "";
  String brut = "";
  List<String> couplets = [];
  String refrain = "";
  String coupletsString = "";
  String identifiantglobal = "";
  List<Compositeur> compositeurs = [];
  String references = "";
  Map<String, dynamic> refs = {};
  int numeroImage = 1;
  bool numeroImageEstBon = false;

  CantiqueLangue();

  CantiqueLangue.fromJSON(Map<String, dynamic> json) {
    // print("CantiqueLangue.fromJSON");
    id = json["id"];
    // print("id : " + id);

    titre = json["titre"];
    // print("titre : " + titre);

    brut = json["brut"];
    // print("brut : " + brut);

    refrain = json["refrain"] ?? "";
    // print("refrain : " + refrain);

    coupletsString = json["coupletsString"] ?? "";
    // print("coupletsString : " + coupletsString);

    identifiantglobal = json["identifiantglobal"] ?? "";
    try {
      numeroImageEstBon = json["numeroImageEstBon"] ?? false;
    } catch (e) {
      numeroImageEstBon = false;
    }
    try {
      numeroImage = json["numeroImage"] ?? 1;
    } catch (e) {
      numeroImage = 1;
      print(e);
    }
    // print("identifiantglobal : " + identifiantglobal);

    references = json["references"] ?? "";
    refs = json["refs"];
    // print("references : " + references);

    // print("langue");
    langue = Langue.fromJSON(json["langue"]);

    couplets = coupletsString.split("\n\n");

    compositeurs = compositeursFromJSON(json["compositeurs"]);
  }

  toJSON() {
    return {
      "id": id,
      "titre": titre,
      "brut": brut,
      "refrain": refrain,
      "langue": langue.toJSON(),
      "couplets": couplets,
      "coupletsString": coupletsString,
      "identifiantglobal": identifiantglobal,
      "references": references,
      "refs": refs,
      "numeroImage": numeroImage,
      "numeroImageEstBon": numeroImageEstBon,
      "compositeurs": compositeursToJSON(compositeurs),
    };
  }

  List<Compositeur> compositeursFromJSON(List<dynamic> jsons) {
    List<Compositeur> compositeurs = [];
    jsons.forEach((json) {
      compositeurs.add(Compositeur.fromJSON(json));
    });
    return compositeurs;
  }

  List compositeursToJSON(List<Compositeur> compositeurs) {
    List<dynamic> jsons = [];
    compositeurs.forEach((compositeur) {
      jsons.add(compositeur.toJSON());
    });
    return jsons;
  }

  String getRefs() {
    Map<String, dynamic> recueils = refs;
    Map<String, dynamic> resultats = {};
    recueils.keys.forEach((key) {
      if (recueils[key] != 0) {
        resultats[key] = recueils[key];
      }
    });
    return resultats.toString().replaceAll("{", "").replaceAll("}", "").trim();
  }

  getScore() {
    Map<String, dynamic> recueils = refs;
    Map<String, dynamic> resultats = {};
    recueils.keys.forEach((key) {
      if (recueils[key] != 0) {
        resultats[key] = recueils[key];
      }
    });
    return resultats.keys.length;
  }
}
