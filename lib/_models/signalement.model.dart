import 'package:cantiques/_models/cantique.langue.model.dart';

class Signalement {
  String id = "${DateTime.now().microsecondsSinceEpoch}";
  String commentaire = "";
  CantiqueLangue? cantique;
  DateTime date = DateTime.now();

  Signalement();

  Signalement.init(CantiqueLangue b, String? comm) {
    if (comm != null) commentaire = comm;
    cantique = b;
  }

  Signalement.fromJSON(Map<String, dynamic> json) {
    id = json["id"];
    commentaire = json["commentaire"];
    cantique = CantiqueLangue.fromJSON(json["cantique"]);
    date = DateTime.parse(json["date"]);
  }

  toJSON() {
    return {
      "id": id,
      "commentaire": commentaire,
      "date": date.toIso8601String(),
      "cantique": cantique != null ? cantique!.toJSON() : null,
    };
  }
}
