import 'package:cantiques/_providers/langue.provider.dart';
import 'package:cantiques/_services/cantique.service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cantiqueProvider = FutureProvider((ref) async {
  print("Lauching cantique provider");
  CantiqueService _cantiqueService = CantiqueService();
  // On utilise `ref.watch` pour écouter un autre provider,
  // et on lui passe le provider que l'on veut consommer.

  final langue = ref.watch(langueProvider);

  // On peut ensuite utiliser le résultat pour faire quelque chose en
  // fonction de la valeur de `cityProvider`.
  return _cantiqueService.getAllByLangue(langue);
});
