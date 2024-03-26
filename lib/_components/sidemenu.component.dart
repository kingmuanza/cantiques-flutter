import 'package:cantiques/_components/icone.partition.dart';
import 'package:cantiques/pages/accueil.page.dart';
import 'package:cantiques/pages/bulu.aux.autres.dart';
import 'package:cantiques/pages/clement.good.dart';
import 'package:cantiques/pages/favoris.page.dart';
import 'package:cantiques/pages/home.page.dart';
import 'package:cantiques/pages/madame.cozzens.dart';
import 'package:cantiques/pages/mot.coordinatrice.dart';
import 'package:cantiques/pages/parametres.page.dart';
import 'package:cantiques/pages/preface.page.dart';
import 'package:cantiques/pages/themes.list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/cli_commands.dart';

import '../pages/compositeurs/compositeur.list.dart';

class MySideMenu extends StatefulWidget {
  const MySideMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<MySideMenu> createState() => _MySideMenuState();
}

class _MySideMenuState extends State<MySideMenu> with SingleTickerProviderStateMixin {
  bool showInfosItems = false;
  AnimationController? _controller;

  double positionDepart = 0.0;
  double positionArrivee = 0.25;

  @override
  void initState() {
    print("Le menu a été initialisé");
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 250), // Durée de l'animation : 500 millisecondes (une demi-seconde)
      vsync: this,
    );
  }

  @override
  void dispose() {
    if (_controller != null) _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(24),
            height: 100,
            width: 100,
            child: CircleAvatar(
              backgroundColor: Colors.brown.shade900,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset("assets/icons/icon.png"),
              ),
            ),
          ),
          Container(
            child: Text(
              "Recueil de Cantiques Protestants",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 32, top: 8),
            child: Text(
              "En langues Bulu, Bassa, Bafia, Duala avec partitions en Anglais et en Francais",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.7)),
            ),
          ),
          Divider(),
          ListTile(
            title: Text("Accueil"),
            leading: Icon(Icons.text_snippet_outlined),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const PrefacePage(),
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            title: Text("Mot de la coordinatrice"),
            leading: Icon(Icons.edit_note),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const MotCoordinatrice(),
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            title: Text("Le mécène"),
            leading: Icon(Icons.back_hand_outlined),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const MotCoordinatrice(),
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            title: Text("I" + "LS ONT MARQUÉ LA MISSION PRESBYTÉRIENNE AMERICAINE".toLowerCase(), style: TextStyle(height: 1.15)),
            leading: Icon(Icons.star_outline),
            trailing: _controller != null
                ? RotationTransition(
                    turns: Tween(begin: positionDepart, end: positionArrivee).animate(_controller!), // Rotation de 0 à 90 degrés (0.25 de tour)
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey.shade400,
                    ),
                  )
                : Container(
                    width: 0,
                    height: 0,
                  ),
            onTap: () async {
              print("depart ${positionDepart}");
              print("arrivee ${positionArrivee}");
              showInfosItems = !showInfosItems;
              if (_controller != null) {
                if (showInfosItems) {
                  await _controller!.forward(from: 0.0);
                } else {
                  await _controller!.animateBack(0.0);
                }
                /* if (positionDepart == 0.25) {
                  positionDepart = 0.0;
                } else {
                  positionDepart = 0.25;
                }
                if (positionArrivee == 0.25) {
                  positionArrivee = 0.0;
                } else {
                  positionArrivee = 0.25;
                } */
              }
              setState(() {});
            },
          ),
          showInfosItems
              ? Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text("ADOLPHUS CLEMENS GOOD".capitalize()),
                        leading: Icon(Icons.person_outlined),
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) => const ClementGood(),
                            ),
                          );
                        },
                      ),
                      Divider(),
                      ListTile(
                        title: Text("LUCIA HAMMOND ÉPSE COZZENS".capitalize()),
                        leading: Icon(Icons.person_2_outlined),
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) => const MadameCozzens(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                )
              : Container(
                  height: 0,
                ),
          Divider(),
          ListTile(
            title: Text("L'Eglise Presbytérienne d'Elat", style: TextStyle(height: 1.15)),
            leading: Icon(Icons.church_outlined),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const MotCoordinatrice(),
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            title: Text("Le Sécrétaire Général de l'EPC", style: TextStyle(height: 1.15)),
            leading: Icon(Icons.person_outlined),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const MotCoordinatrice(),
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            title: Text("Le comité de rédaction", style: TextStyle(height: 1.15)),
            leading: Icon(Icons.people_alt_outlined),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const MotCoordinatrice(),
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            title: Text("Cantiques"),
            leading: Icon(Icons.music_note_outlined),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const HomePage(),
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            title: Text("Thèmes"),
            leading: Icon(Icons.folder_open_sharp),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const ThemeList(),
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            title: Text("Favoris"),
            leading: Icon(Icons.star_border_outlined),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const FavorisPage(),
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            title: Text("Infos"),
            leading: Icon(Icons.info),
            onTap: () {
              showInfosItems = !showInfosItems;
              setState(() {});
            },
          ),
          Divider(),
          ListTile(
            title: Text("Compositeurs"),
            leading: Icon(Icons.people),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const CompositeurListPage(),
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            title: Text("Paramètres"),
            leading: Icon(Icons.settings),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const ParametresPage(),
                ),
              );
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
