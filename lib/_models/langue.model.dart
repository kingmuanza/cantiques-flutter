class Langue {
  String id = "";
  String code = "";
  String nom = "";

  Langue();

  Langue.init(String a, String b) {
    id = a;
    code = a;
    nom = b;
  }

  Langue.fromJSON(Map<String, dynamic> json) {
    id = json["id"];
    code = json["code"];
    nom = json["nom"];
  }

  toJSON() {
    return {
      "id": id,
      "code": code,
      "nom": nom,
    };
  }
}
