class Langue {
  String id = "";
  String code = "";
  String nom = "";
  String plage = "";

  Langue();

  Langue.init(String a, String b, String p) {
    id = a;
    code = a;
    nom = b;
    plage = p;
  }

  Langue.fromJSON(Map<String, dynamic> json) {
    id = json["id"];
    code = json["code"];
    nom = json["nom"];
    plage = json["plage"] ?? "";
  }

  toJSON() {
    return {
      "id": id,
      "code": code,
      "nom": nom,
      "plage": plage,
    };
  }
}
