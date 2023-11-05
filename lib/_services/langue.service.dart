import '../_models/langue.model.dart';

class LangueService {
  List<Langue> getAll() {
    print("LangueService getAll");
    return [
      Langue.init("BULU", "Bulu", "1-396, Bia Be Zambe"),
      Langue.init("BASSA", "Bassa", "1-572"),
      Langue.init("BAFIA", "Bafia", "1-486"),
      Langue.init("DOUALA", "Duala", "1-383"),
      Langue.init("ANG", "Anglais", ""),
    ];
  }

  Langue get(String id) {
    Langue langue = Langue();
    langue.code = "FR";
    langue.nom = "Français";
    return langue;
  }
}
