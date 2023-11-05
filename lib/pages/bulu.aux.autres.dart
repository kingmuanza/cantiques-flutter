import 'package:cantiques/_components/sidemenu.component.dart';
import 'package:flutter/material.dart';

import '../_components/cantiques.recents.dart';
import '../_models/cantique.langue.model.dart';
import '../_models/langue.model.dart';
import '../_services/cantiquelangue.service.dart';
import '../_services/langue.service.dart';
import 'cantiquelangue/cantique.langue.list.dart';
import 'cantiquelangue/cantique.langue.view.dart';

class BuluAuxAutres extends StatefulWidget {
  const BuluAuxAutres({super.key});

  @override
  State<BuluAuxAutres> createState() => _BuluAuxAutresState();
}

class _BuluAuxAutresState extends State<BuluAuxAutres> {
  List<CantiqueLangue> cantiques = [];
  List<Langue> langues = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    langues = LangueService()
        .getAll()
        .where((element) => element.code != "ANG")
        .toList();
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
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 4,
        ),
        child: ListView(
          children: [
            Container(
              width: 250,
              child: Text(
                "Des cantiques Bulu aux autres langues ",
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
                "Nos cantiques sont tirés des cantiques suivants avec les numéros correspondants",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
            ),
            Container(
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
                          color: Colors.brown.shade900,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 24,
                      ),
                      margin: const EdgeInsets.symmetric(
                        vertical: 2.0,
                        horizontal: 0,
                      ),
                      child: Text(
                        langue.nom + " " + langue.plage,
                        style: TextStyle(
                          color: Colors.brown.shade900,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32.0, bottom: 8),
              child: Container(
                width: double.infinity,
                child: Text(
                  "Partant du Cantique BULU, nous avons selectionné ceux chantés en Bassa, Bafia, Duala. " +
                      "On y a ajouté les partitions " +
                      "Nous en avons trouvé 91." +
                      "Ceux chantés en 3 de ces langues : 159 + partitions. " +
                      "Ceux chantés en 2 de ces langues : 79 + partitions; " +
                      "Ceux chantés en une langue uniquement le BULU : 70+ partitions" +
                      "",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
              ),
            ),
            Container(
              height: 200,
              width: double.infinity,
              child: CantiquesRecents(
                cantiques: cantiques.length > 2 ? cantiques.sublist(1) : [],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                "Ce découpage provient de nos recherches qui nous ont permises de classer nos cantiques par groupe, en fonction des traductions obtenues",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
            ),
            Container(
              height: 50,
            )
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
