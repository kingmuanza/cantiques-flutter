import 'package:cantiques/_components/sidemenu.component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/cli_commands.dart';

class Eglise extends StatefulWidget {
  const Eglise({super.key});

  @override
  State<Eglise> createState() => _EgliseState();
}

class _EgliseState extends State<Eglise> {
  List<String> textes = [
    "Elle est l'une des plus anciennes églises protestantes du Cameroun, considérée au début du XXe siècle comme l'une des plus grandes églises locales presbytériennes du monde.",
    "Fondée par des missionnaires américains, elle est rattachée depuis 1957 à l'Église presbytérienne camerounaise (EPC). Elle est située dans l'arrondissement d'Ebolowa, le département de la Mvila et la région du Sud.",
    "C'est à Elat qu'est proclamée l'autonomie de l'Église presbytérienne camerounaise (EPC), le 11 décembre 1957. À cette date, l'église pouvait accueillir jusqu'à 3 500 fidèles. Dans l'hôpital qui comptait 250 lits, 17 000 patients étaient soignés chaque année. L'imprimerie appelée Halsey Mémorial Press produisait de nombreuses opuscules rédigées par les missionnaires dans les langues locales, le bulu et le bassa.",
    "",
    "",
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
                "L'ÉGLISE PRESBYTÉRIENNE D'ELAT",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, height: 1.15),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 24),
              child: Image.asset(
                "assets/images/eglise.png",
                height: 250,
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
            Container(
              margin: EdgeInsets.only(bottom: 16),
              width: double.infinity,
              child: Text(
                textes[4],
                textAlign: TextAlign.justify,
                style: TextStyle(height: 1.15),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              width: double.infinity,
              child: Text(
                textes[5],
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
