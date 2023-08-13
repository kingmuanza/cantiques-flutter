class Compositeur {
  String id = "";
  String nom = "";

  Compositeur();

  Compositeur.init(String a, String b) {
    id = a.replaceAll(" ", "-");
    nom = b;
  }

  Compositeur.fromJSON(Map<String, dynamic> json) {
    id = json["id"];
    nom = json["nom"];
  }

  toJSON() {
    return {
      "id": id,
      "nom": nom,
    };
  }
}
