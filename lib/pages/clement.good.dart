import 'package:cantiques/_components/sidemenu.component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/cli_commands.dart';

class ClementGood extends StatefulWidget {
  const ClementGood({super.key});

  @override
  State<ClementGood> createState() => _ClementGoodState();
}

class _ClementGoodState extends State<ClementGood> {
  List<String> textes = [
    "Adolph     Clemens     Good     était     un     missionnaire     et un naturaliste américain. Il est né le 19 décembre 1856 à West Mahoning en   Pennsylvanie   et   mort   le   13   décembre 1894 à Efoulan au Cameroun où il a été enterré."
        .replaceAll("  ", " ")
        .replaceAll("  ", " "),
    "Fils d’Abram Good et Hanah née Irwin, il fait ses études à Washington au Jefferson Collège et est diplômé en 1879. Il entre ensuite au Western Théologal Seminary. Il est consacré pasteur au sein de l’Église presbytérienne en 1882."
        .replaceAll("  ", " ")
        .replaceAll("  ", " "),
    "Il part comme missionnaire dans le Congo français la même année.",
    "Après s’être établie en Guinée espagnole et au Gabon, la Mission presbytérienne américaine (MPA) arrive au Cameroun à la fin du xixe siècle aidé par des camerounais bulu. Le pasteur Good fonde une mission à Efoulan, en pays bulu dont la langue est une nuance du Fang qu'il maitrisait.",
    "Son œuvre missionnaire protestante est, en termes de productivité et de rayonnement, exceptionnelle.",
    "La station missionnaire, d’abord implantée à Ebolowa, est déplacée à Elat, à la demande de l’administration coloniale qui voulait établir un poste militaire sur le site. Elat devient peu à peu un centre scolaire de renommé, doté d’une école professionnelle et d’une imprimerie. La station construit aussi un hôpital pourvu d’un bloc opératoire, d’une maternité, d’un orphelinat, d’une léproserie, ainsi que d’une école d’infirmiers et d’infirmières.",
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
              margin: EdgeInsets.only(bottom: 12),
              width: MediaQuery.of(context).size.width * 0.5,
              child: Text(
                "I" + "LS ONT MARQUÉ LA MISSION PRESBYTÉRIENNE AMERICAINE".toLowerCase(),
                style: TextStyle(fontSize: 12, height: 1.15, color: Colors.grey),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 24),
              width: 220,
              child: Text(
                "ADOLPHUS CLEMENS GOOD",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, height: 1.15),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 24),
              child: Image.asset(
                "assets/images/clement.png",
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
