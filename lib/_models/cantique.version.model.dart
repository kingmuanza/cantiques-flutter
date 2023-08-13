import 'package:cantiques/_models/langue.model.dart';

class CantiqueVersion {
  String id = "";
  Langue langue = Langue();
  String titre = "";
  List<String> couplets = [];
  String refrain = "";

  CantiqueVersion();

  CantiqueVersion.fromJSON(Map<String, dynamic> json) {
    print("CantiqueVersion.fromJSON");
    id = json["id"];
    print("id : " + id);
    titre = json["titre"];
    print("titre : " + titre);
    refrain = json["refrain"] ?? "";
    print("refrain : " + refrain);
    print("langue");
    print(json["langue"]);
    langue = Langue.fromJSON(json["langue"]);
    print(json["couplets"].length);

    couplets = [];
    dynamic cs = json["couplets"];
    cs.forEach((c) {
      couplets.add(c);
    });

    print(couplets);
  }

  toJSON() {
    return {
      "id": id,
      "titre": titre,
      "refrain": refrain,
      "langue": langue.toJSON(),
      "couplets": couplets,
    };
  }
}
