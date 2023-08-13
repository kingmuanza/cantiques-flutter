import 'package:cantiques/_models/langue.model.dart';
import 'package:cantiques/_services/langue.service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final languesProvider = Provider<List<Langue>>(
  (ref) {
    return LangueService().getAll();
  },
);

final langueProvider = StateProvider<String>(
  (ref) {
    return "FR";
  },
);
