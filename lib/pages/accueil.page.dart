import 'package:cantiques/_components/display.cantique.langue.dart';
import 'package:cantiques/_components/sidemenu.component.dart';
import 'package:cantiques/_models/cantique.model.dart';
import 'package:cantiques/_services/cantiquelangue.service.dart';
import 'package:cantiques/pages/cantiquelangue/cantique.langue.view.dart';
import 'package:flutter/material.dart';

import '../_models/cantique.langue.model.dart';

class AccueilPage extends StatefulWidget {
  const AccueilPage({super.key});

  @override
  State<AccueilPage> createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
  List<CantiqueLangue> cantiques = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
        title: Text(
          "Accueil",
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              backgroundColor: Colors.brown,
              radius: 40.0,
              child: CircleAvatar(
                radius: 30.0,
                backgroundImage: AssetImage("assets/images/muanzacote.png"),
                backgroundColor: Colors.brown,
              ),
            ),
          ),
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
              TextFormField(
                onTap: () {
                  showSearch(
                    context: context,
                    delegate: CantiqueLangueSearchDelegate(cantiques),
                  );
                },
                decoration: InputDecoration(
                  labelText: "Rechercher",
                  contentPadding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 0),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                  suffixIcon: Icon(Icons.search_outlined),
                ),
              ),
              CantiquesRecents(
                cantiques: cantiques.length > 2 ? cantiques.sublist(1) : [],
              ),
              cantiques.length > 0
                  ? CantiqueDuJour(
                      cantiqueLangue: cantiques[0],
                    )
                  : Container(
                      width: 0,
                      height: 0,
                    ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.list),
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

class CantiquesRecents extends StatelessWidget {
  final List<CantiqueLangue> cantiques;
  const CantiquesRecents({
    Key? key,
    required this.cantiques,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Container(
            width: double.infinity,
            child: Text("Cantiques récemment ouverts"),
          ),
        ),
        Container(
          height: 208,
          child: Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: ListView.builder(
              itemCount: cantiques.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                CantiqueLangue cl = cantiques[index];
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push<void>(
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => CantiqueLangueView(
                          cantiqueLangue: cl,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 8.0),
                    padding: const EdgeInsets.all(12.0),
                    color: Colors.brown.shade900,
                    height: 200,
                    width: 150,
                    child: Column(
                      children: [
                        Expanded(
                          child: Center(
                            child: Text(
                              cl.titre,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 20,
                          width: double.infinity,
                          child: Text(
                            "Bassa",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
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
