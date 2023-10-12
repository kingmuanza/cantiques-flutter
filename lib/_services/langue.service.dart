import '../_models/langue.model.dart';

class LangueService {
  List<Langue> getAll() {
    print("LangueService getAll");
    return [
      Langue.init("ANG", "Anglais"),
      Langue.init("BULU", "Bulu"),
      Langue.init("BAFIA", "Bafia"),
      Langue.init("BASSA", "Bassa"),
      Langue.init("DLA", "Douala"),
    ];
  }

  Langue get(String id) {
    Langue langue = Langue();
    langue.code = "FR";
    langue.nom = "Français";
    return langue;
  }
}
