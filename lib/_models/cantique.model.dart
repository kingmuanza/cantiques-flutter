import 'package:cantiques/_models/cantique.theme.model.dart';
import 'package:cantiques/_models/cantique.version.model.dart';

class Cantique {
  String id = "";
  String numero = "";
  List<CantiqueVersion> versions = [];
  CantiqueTheme theme = CantiqueTheme();
  String compositeur = "";

  Cantique();

  Cantique.fromJSON(Map<String, dynamic> json) {
    print("Cantique.fromJSON");
    id = json["id"];
    print("id :" + id);
    numero = json["numero"];
    print("numero :" + numero);
    compositeur = json["compositeur"] ?? "";
    print("compositeur : " + compositeur);
    versions = versionsFromJSON(json["versions"]);
  }

  toJSON() {
    return {
      "id": id,
      "numero": numero,
      "versions": versionsToJSON(versions),
      "compositeur": compositeur,
    };
  }

  versionsFromJSON(List<dynamic> jsons) {
    print("versionsFromJSON");
    print(jsons);
    List<CantiqueVersion> versions = [];
    jsons.forEach((json) {
      versions.add(CantiqueVersion.fromJSON(json));
    });
    return versions;
  }

  versionsToJSON(List<CantiqueVersion> versions) {
    List<dynamic> jsons = [];
    versions.forEach((version) {
      jsons.add(version.toJSON());
    });
    return jsons;
  }

  CantiqueVersion getVersion(String codelangue) {
    CantiqueVersion cantiqueVersion = versions[0];
    versions.forEach((version) {
      if (codelangue == version.langue.code) {
        cantiqueVersion = version;
      }
    });
    return cantiqueVersion;
  }
}
