import 'package:cantiques/pages/accueil.page.dart';
import 'package:cantiques/pages/home.page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print("Lauching my app");
    return MaterialApp(
        title: 'Cantiques',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Filson",
          primarySwatch: Colors.brown,
        ),
        home: const HomePage());
  }
}
