import 'package:cantiques/_components/display.cantique.langue.dart';
import 'package:cantiques/_components/sidemenu.component.dart';
import 'package:cantiques/_models/langue.model.dart';
import 'package:cantiques/_services/cantiquelangue.service.dart';
import 'package:cantiques/_services/langue.service.dart';
import 'package:cantiques/pages/cantiquelangue/cantique.langue.list.dart';
import 'package:cantiques/pages/cantiquelangue/cantique.langue.view.dart';
import 'package:flutter/material.dart';

import '../_components/cantiques.recents.dart';
import '../_models/cantique.langue.model.dart';

class AccueilPage extends StatefulWidget {
  const AccueilPage({super.key});

  @override
  State<AccueilPage> createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
  List<CantiqueLangue> cantiques = [];
  List<Langue> langues = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    langues = LangueService().getAll();
    CantiqueLangueService().getAll().then((values) {
      cantiques = values;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: MySideMenu(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.0,
        actions: [
          IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CantiqueLangueSearchDelegate(cantiques),
                );
              },
              icon: Icon(Icons.search)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 4,
          ),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: Text(
                  "Bienvenue !",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 16, top: 14),
                child: Text(
                  "Nos cantiques sont disponibles dans les langues suivantes, ce sont des langues parlées au Cameroun",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  crossAxisAlignment: WrapCrossAlignment.end,
                  children: List.generate(langues.length, (index) {
                    Langue langue = langues[index];
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push<void>(
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => CantiqueLangueList(
                              langue: langue,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Colors.brown,
                          ),
                          borderRadius: BorderRadius.circular(32),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 24),
                        margin: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 0),
                        child: Text(
                          langue.nom,
                          style: TextStyle(color: Colors.brown.shade900),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              CantiquesRecents(
                cantiques: cantiques.length > 2 ? cantiques.sublist(1) : [],
              ),
              Container(
                height: 0,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CantiqueDuJour extends StatelessWidget {
  final CantiqueLangue cantiqueLangue;
  const CantiqueDuJour({
    Key? key,
    required this.cantiqueLangue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16.0),
      decoration: BoxDecoration(
        color: Colors.brown.withOpacity(0.1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: Container(
                width: double.infinity,
                child: Text("Cantique du jour"),
              ),
            ),
            Container(
              width: double.infinity,
              child: Text(
                cantiqueLangue.titre,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            DisplayCantiqueLangue(cantiqueLangue: cantiqueLangue),
          ],
        ),
      ),
    );
  }
}

class CantiqueLangueSearchDelegate extends SearchDelegate {
  List<CantiqueLangue> cantiques = [];

  CantiqueLangueSearchDelegate(List<CantiqueLangue> values) {
    cantiques = values;
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            close(context, null);
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: cantiques.length,
        itemBuilder: (context, index) {
          CantiqueLangue cl = cantiques[index];
          return ListTile(
            title: Text(cl.titre),
            onTap: () {
              Navigator.of(context).push<void>(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => CantiqueLangueView(
                    cantiqueLangue: cl,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
