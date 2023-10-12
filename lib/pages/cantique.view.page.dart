import 'dart:math';

import 'package:cantiques/_models/cantique.langue.model.dart';
import 'package:cantiques/_models/cantique.model.dart';
import 'package:cantiques/_providers/langue.provider.dart';
import 'package:cantiques/_services/cantique.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CantiqueViewPage extends ConsumerStatefulWidget {
  final CantiqueLangue cantique;

  const CantiqueViewPage(this.cantique, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CantiqueViewPageState();
}

class _CantiqueViewPageState extends ConsumerState<CantiqueViewPage> with TickerProviderStateMixin {
  // late TabController tabController;
  String titre = "";
  List<String> lignes = [];
  bool isFavoris = true;

  @override
  void initState() {
    super.initState();

    titre = widget.cantique.titre;
    lignes = widget.cantique.brut.split("\n");
    /* tabController = TabController(
      initialIndex: 0,
      length: widget.cantique.versions.length,
      vsync: this,
    );
    tabController.addListener(
      () {
        titre = widget.cantique.versions[tabController.index].titre;
        setState(() {});
      },
    );

    final langue = ref.read(langueProvider);
    int i = 0;
    int index = 0;
    for (var element in widget.cantique.versions) {
      if (element.langue.code == langue) {
        index = i;
      }
      i++;
    }
    tabController.animateTo(index); */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(titre),
          centerTitle: true,
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
          /* bottom: TabBar(
          controller: tabController,
          tabs: widget.cantique.versions.map((version) {
            return Tab(text: version.langue.nom);
          }).toList(),
        ), */
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            String ligne = lignes[index];
            return Container(
              width: double.infinity,
              child: Text(ligne),
            );
          },
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
