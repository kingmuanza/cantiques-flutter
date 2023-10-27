import 'package:cantiques/_components/sidemenu.component.dart';
import 'package:cantiques/_services/compositeur.saervice.dart';
import 'package:cantiques/pages/compositeurs/compositeur.view.dart';
import 'package:flutter/material.dart';

import '../../_models/compositeur.model.dart';

class CompositeurListPage extends StatefulWidget {
  const CompositeurListPage({super.key});

  @override
  State<CompositeurListPage> createState() => _CompositeurListPageState();
}

class _CompositeurListPageState extends State<CompositeurListPage> {
  List<Compositeur> compositeurs = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CompositeurService().getAll().then((values) {
      compositeurs = values;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade900,
      drawer: MySideMenu(),
      appBar: AppBar(
        elevation: 0,
        title: Text("Compositeurs"),
        backgroundColor: Colors.brown.shade900,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: compositeurs.length,
        itemBuilder: (context, index) {
          Compositeur compositeur = compositeurs[index];
          return Container(
            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.brown.shade900,
              ),
              title: Text(compositeur.nom),
              onTap: () {
                Navigator.of(context).push<void>(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => CompositeurViewPage(
                      compositeur: compositeur,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
