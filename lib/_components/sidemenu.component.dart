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

import '../pages/compositeurs/compositeur.list.dart';

class MySideMenu extends StatefulWidget {
  const MySideMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<MySideMenu> createState() => _MySideMenuState();
}

class _MySideMenuState extends State<MySideMenu> {
  bool showInfosItems = false;

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
          showInfosItems
              ? Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Column(
                    children: [
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
                        title: Text("Rev. Clément Good"),
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
                        title: Text("Madame Cozzens"),
                        leading: Icon(Icons.person),
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) => const MadameCozzens(),
                            ),
                          );
                        },
                      ),
                      Divider(),
                      ListTile(
                        title: Text("Des cantiques Bulu aux autres langues"),
                        leading: IconePartition(),
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) => const BuluAuxAutres(),
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
