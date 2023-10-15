import 'dart:math';

import 'package:cantiques/_models/cantique.langue.model.dart';
import 'package:cantiques/_models/cantique.model.dart';
import 'package:cantiques/_providers/langue.provider.dart';
import 'package:cantiques/_services/cantique.service.dart';
import 'package:cantiques/_services/cantiquelangue.service.dart';
import 'package:cantiques/pages/cantiquelangue/partition.view.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../_models/langue.model.dart';

class CantiqueViewPage extends ConsumerStatefulWidget {
  final CantiqueLangue cantique;

  const CantiqueViewPage(this.cantique, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CantiqueViewPageState();
}

class _CantiqueViewPageState extends ConsumerState<CantiqueViewPage> with TickerProviderStateMixin {
  late TabController tabController;
  String titre = "";
  List<String> lignes = [];
  bool isFavoris = true;
  List<Langue> langues = [];
  List<CantiqueLangue> cantiques = [];
  late CantiqueLangue cantique;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: cantiques.length,
      vsync: this,
    );

    CantiqueLangueService().getAllByIdentifiant(widget.cantique.identifiantglobal).then((values) {
      cantiques = values;
      tabController = TabController(
        initialIndex: 0,
        length: cantiques.length,
        vsync: this,
      );

      for (var i = 0; i < cantiques.length; i++) {
        CantiqueLangue c = cantiques[i];
        if (c.langue.code == widget.cantique.langue.code) {
          tabController.animateTo(i, duration: Duration(milliseconds: 300));
        }
      }
      tabController.addListener(
        () {
          cantique = CantiqueLangueService().formatCantiqueLangue(cantiques[tabController.index]);
          titre = cantiques[tabController.index].titre;
          lignes = cantique.couplets;
          setState(() {});
        },
      );
      setState(() {});
    });
    cantique = CantiqueLangueService().formatCantiqueLangue(widget.cantique);
    titre = cantique.titre;
    lignes = cantique.couplets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(titre),
          centerTitle: true,
          backgroundColor: Colors.brown.shade900,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {
                isFavoris = !isFavoris;
                // CantiqueService().addToFavoris(widget.cantique);
                setState(() {});
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(isFavoris ? "Ajouté aux favoris" : "Retiré des favoris"),
                    backgroundColor: Colors.brown.shade900,
                  ),
                );
              },
              icon: Icon(
                isFavoris ? Icons.star : Icons.star_border_outlined,
                color: Colors.yellow,
              ),
            ),
          ],
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.yellow,
            controller: tabController,
            tabs: cantiques.map((version) {
              return Tab(text: version.langue.nom);
            }).toList(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: lignes.length + 1,
            itemBuilder: (context, index) {
              if (index != 1) {
                String ligne = lignes[max(index - 1, 0)];
                return Container(
                  width: double.infinity,
                  child: Text(
                    ligne,
                    style: TextStyle(fontSize: 16),
                  ),
                );
              } else {
                return Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 24),
                  child: Text(
                    cantique.refrain,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }
            },
          ),
        ),
        bottomNavigationBar: InkWell(
          onTap: () {
            Navigator.of(context).push<void>(
              MaterialPageRoute<void>(
                builder: (BuildContext context) => PartitionViewPage(
                  numeroPartition: 2,
                  titre: titre,
                ),
              ),
            );
          },
          child: Container(
            height: 60,
            color: Colors.yellow,
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  child: Center(
                    child: Icon(
                      Icons.music_note,
                      size: 30,
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                      child: Text(
                    "Voir la partition",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.brown.shade900,
                    ),
                  )),
                ),
                Container(
                  width: 60,
                  height: 60,
                  child: Center(
                    child: Icon(
                      Icons.music_note,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  /*  TabBarView plutard() {
    return TabBarView(
        controller: tabController,
        children: widget.cantique.versions.map((version) {
          return ListView.builder(
            itemCount: version.couplets.length + 1,
            itemBuilder: (context, index) {
              if (index != 1) {
                String couplet = version.couplets[max(index - 1, 0)];
                return Container(
                  padding: EdgeInsets.only(
                    left: 32.0,
                    right: 32.0,
                    top: index == 0 ? 24.0 : 8,
                    bottom: 8,
                  ),
                  child: Text(
                    couplet,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                );
              } else {
                if (version.refrain != null && version.refrain != "") {
                  return Container(
                    padding: EdgeInsets.only(
                      left: 32.0,
                      right: 32.0,
                      top: 8,
                      bottom: 8,
                    ),
                    child: Text(
                      version.refrain,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                } else {
                  return Container(
                    height: 0,
                    width: 0,
                  );
                }
              }
            },
          );
        }).toList());
  } */

}
