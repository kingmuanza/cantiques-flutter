import 'package:cloud_firestore/cloud_firestore.dart';

import '../_models/signalement.model.dart';

class SignalementService {
  Future<Signalement> save(Signalement signalement) async {
    print("getAllCantiqueInOthersLangues");
    FirebaseFirestore db = FirebaseFirestore.instance;

    await db.collection("signalement").doc(signalement.id).set(signalement.toJSON());

    return signalement;
  }
}
