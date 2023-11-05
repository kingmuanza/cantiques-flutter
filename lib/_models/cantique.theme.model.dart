class CantiqueTheme {
  String id = "";
  String code = "";
  String nom = "";
  String plage = "";

  CantiqueTheme();

  CantiqueTheme.init(String p) {
    nom = p;
  }

  CantiqueTheme.fromJSON(Map<String, dynamic> json) {
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
