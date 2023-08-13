import '../_models/langue.model.dart';

class LangueService {
  List<Langue> getAll() {
    print("LangueService getAll");
    return [
      Langue.init("FR", "Français"),
      Langue.init("EN", "English"),
      Langue.init("BULU", "BULU"),
      Langue.init("BASSA", "BASSA"),
      Langue.init("DOUALA", "DOUALA"),
    ];
  }

  Langue get(String id) {
    Langue langue = Langue();
    langue.code = "FR";
    langue.nom = "Français";
    return langue;
  }
}
