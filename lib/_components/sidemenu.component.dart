import 'package:cantiques/pages/favoris.page.dart';
import 'package:cantiques/pages/home.page.dart';
import 'package:cantiques/pages/parametres.page.dart';
import 'package:cantiques/pages/preface.page.dart';
import 'package:flutter/material.dart';

class MySideMenu extends StatelessWidget {
  const MySideMenu({
    Key? key,
  }) : super(key: key);

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
              backgroundColor: Colors.brown,
            ),
          ),
          Container(
            child: Text(
              "Recueil de cantiques",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 32),
            child: Text(
              "Bassa, Bulu, Douala, Français, Anglais",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          Divider(),
          ListTile(
            title: Text("Préface"),
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
