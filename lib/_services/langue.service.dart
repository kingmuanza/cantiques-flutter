import '../_models/langue.model.dart';

class LangueService {
  List<Langue> getAll() {
    print("LangueService getAll");
    return [
      Langue.init("BULU", "Bulu"),
      Langue.init("BASSA", "Bassa"),
      Langue.init("BAFIA", "Bafia"),
      Langue.init("DOUALA", "Douala"),
      Langue.init("ANG", "Anglais"),
    ];
  }

  Langue get(String id) {
    Langue langue = Langue();
    langue.code = "FR";
    langue.nom = "Français";
    return langue;
  }
}
