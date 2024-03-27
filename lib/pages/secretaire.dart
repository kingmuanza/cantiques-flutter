import 'package:cantiques/_components/sidemenu.component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/cli_commands.dart';

class Secretaire extends StatefulWidget {
  const Secretaire({super.key});

  @override
  State<Secretaire> createState() => _SecretaireState();
}

class _SecretaireState extends State<Secretaire> {
  List<String> textes = [
    "Étant moi-même fils et frère de Pasteur, je me réjouis que les descendants de nos parents puissent faire perpétuer l’évangélisation dans notre pays. Puissent d’autres bonnes volontés y contribuer pour une plus grande édification des chrétiens.",
    "",
    "Pasteur Abessolo Zeh Célestin",
    "",
    "",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: MySideMenu(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.brown.shade900,
        title: Text(""),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 24),
              width: 220,
              child: Text(
                "LE SECRÉTAIRE GENERAL DE L’EPC",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, height: 1.15),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              width: double.infinity,
              child: Text(
                textes[0],
                textAlign: TextAlign.justify,
                style: TextStyle(
                  height: 1.15,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              width: double.infinity,
              child: Text(
                textes[1],
                textAlign: TextAlign.justify,
                style: TextStyle(height: 1.15),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              width: double.infinity,
              child: Text(
                textes[2],
                textAlign: TextAlign.justify,
                style: TextStyle(height: 1.15),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              width: double.infinity,
              child: Text(
                textes[3],
                textAlign: TextAlign.justify,
                style: TextStyle(height: 1.15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
