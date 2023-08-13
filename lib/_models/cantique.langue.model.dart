import 'package:cantiques/_models/compositeur.model.dart';
import 'package:cantiques/_models/langue.model.dart';

class CantiqueLangue {
  String id = "";
  Langue langue = Langue();
  String titre = "";
  List<String> couplets = [];
  String refrain = "";
  String coupletsString = "";
  String identifiantglobal = "";
  List<Compositeur> compositeurs = [];
  String references = "";

  CantiqueLangue();

  CantiqueLangue.fromJSON(Map<String, dynamic> json) {
    print("CantiqueLangue.fromJSON");
    id = json["id"];
    print("id : " + id);

    titre = json["titre"];
    print("titre : " + titre);

    refrain = json["refrain"] ?? "";
    print("refrain : " + refrain);

    coupletsString = json["coupletsString"] ?? "";
    print("coupletsString : " + coupletsString);

    identifiantglobal = json["identifiantglobal"] ?? "";
    print("identifiantglobal : " + identifiantglobal);

    references = json["references"] ?? "";
    print("references : " + references);

    print("langue");
    langue = Langue.fromJSON(json["langue"]);

    print(json["couplets"].length);
    couplets = [];
    dynamic cs = json["couplets"];
    cs.forEach((c) {
      couplets.add(c);
    });
    print(couplets);

    compositeurs = compositeursFromJSON(json["compositeurs"]);
  }

  toJSON() {
    return {
      "id": id,
      "titre": titre,
      "refrain": refrain,
      "langue": langue.toJSON(),
      "couplets": couplets,
      "coupletsString": coupletsString,
      "identifiantglobal": identifiantglobal,
      "references": references,
      "compositeurs": compositeursToJSON(compositeurs),
    };
  }

  List<Compositeur> compositeursFromJSON(List<dynamic> jsons) {
    print("compositeursFromJSON");
    print(jsons);
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
}
