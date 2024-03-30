import 'package:cantiques/_components/sidemenu.component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/cli_commands.dart';

class Comite extends StatefulWidget {
  const Comite({super.key});

  @override
  State<Comite> createState() => _ComiteState();
}

class _ComiteState extends State<Comite> {
  List<String> textes = [
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
                "LE COMITÉ DE RÉDACTION",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, height: 1.15),
              ),
            ),
            ListTile(
              title: Text(
                "Samuel Mvondo Ayolo ",
                style: TextStyle(
                  height: 1.15,
                ),
              ),
            ),
            ListTile(
              title: Text(
                "Pauline Biyong",
                style: TextStyle(
                  height: 1.15,
                ),
              ),
            ),
            ListTile(
              title: Text(
                "Pasteur Philippe Eugène Biyong",
                style: TextStyle(
                  height: 1.15,
                ),
              ),
            ),
            Container(
              child: ListTile(
                title: Text(
                  "Relecture",
                  style: TextStyle(
                    height: 1.15,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text(
                "Pasteur David Bessong ",
                style: TextStyle(
                  height: 1.15,
                ),
              ),
            ),
            ListTile(
              title: Text(
                "Pasteur Jean David Mabe ",
                style: TextStyle(
                  height: 1.15,
                ),
              ),
            ),
            ListTile(
              title: Text(
                "Pasteur Joseph Mbang ",
                style: TextStyle(
                  height: 1.15,
                ),
              ),
            ),
            ListTile(
              title: Text(
                "Winfried Biyong",
                style: TextStyle(
                  height: 1.15,
                ),
              ),
            ),
            Container(
              child: ListTile(
                title: Text(
                  "Mise en page",
                  style: TextStyle(
                    height: 1.15,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text(
                "Romuald Hervé Fofou ",
                style: TextStyle(
                  height: 1.15,
                ),
              ),
            ),
            ListTile(
              title: Text(
                "Dona Biyong ",
                style: TextStyle(
                  height: 1.15,
                ),
              ),
            ),
            ListTile(
              title: Text(
                "Bertrand Youta",
                style: TextStyle(
                  height: 1.15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
