import 'dart:math';

import 'package:cantiques/_models/cantique.langue.model.dart';
import 'package:cantiques/_models/signalement.model.dart';
import 'package:cantiques/_services/cantiquelangue.service.dart';
import 'package:cantiques/_services/signalement.service.dart';
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
  TextEditingController ctr = TextEditingController();
  String urlImage = "";

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
          titre = cantiques[tabController.index].titre.replaceAll("-", "").trim();
          lignes = [cantique.coupletsString];
          urlImage = "https://firebasestorage.googleapis.com/v0/b/cantiques-muanza.appspot.com/o/cantiques%2Fimage" +
              cantique.identifiantglobal +
              ".png?alt=media&token=6dced90a-c181-4e3e-b259-e9f5ded393a0";
          setState(() {});
        },
      );
      setState(() {});
    });
    cantique = CantiqueLangueService().formatCantiqueLangue(widget.cantique);
    titre = cantique.titre;
    lignes = cantique.couplets;
  }

  void handleClick(String value) {
    AlertDialog alert = AlertDialog(
      title: Text("Signaler une erreur"),
      content: Container(
        height: 250,
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              child: Text("Le cantique comporte des erreurs que vous aimeriez signaler ?"),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 16, bottom: 16),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(4)),
              child: Text(
                cantique.langue.nom,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            TextFormField(
              controller: ctr,
              minLines: 4,
              maxLines: 6,
              decoration: InputDecoration(
                labelText: "Ajouter plus d'informations",
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Container(
            child: Text('Annuler'),
          ),
        ),
        TextButton(
          onPressed: () async {
            Signalement signalement = Signalement();
            signalement.cantique = cantique;
            signalement.commentaire = ctr.text;
            signalement.date = DateTime.now();
            print(signalement.toJSON());
            Navigator.of(context).pop();
            ctr.text = "";
            await SignalementService().save(signalement);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Votre signalement a bien été envoyé'),
            ));
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            color: Colors.brown.shade900,
            child: Text(
              'Signaler',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          titre,
          style: TextStyle(fontSize: 15, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.brown.shade900,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.white, // Couleur des icônes de l'AppBar
        ),
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
          PopupMenuButton<String>(
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: "1",
                  child: Text("Signaler un problème"),
                )
              ];
            },
          ),
        ],
        bottom: TabBar(
          isScrollable: true,
          indicatorColor: Colors.yellow,
          labelColor: Colors.yellow,
          controller: tabController,
          unselectedLabelColor: Colors.white,
          tabs: cantiques.map((version) {
            String titre = version.langue.code != "ANG" ? version.langue.nom : "Partition";
            return Tab(
              text: titre + " " + (version.identifiantlocal != "0" ? version.identifiantlocal : ""),
            );
          }).toList(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return cantique.langue.code != "ANG"
                ? Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 24),
                    child: Text(
                      cantique.coupletsString,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  )
                : Container(
                    child: Center(child: Image.network(urlImage)),
                  );
          },
        ),
      ),
      bottomNavigationBar: isAPartition()
          ? InkWell(
              onTap: () {
                List<CantiqueLangue> cls = cantiques.where((element) => element.langue.code == "ANG").toList();
                if (cls.length > 0) {
                  CantiqueLangue cl = cls[0];
                  if (cl.numeroImageEstBon) {
                    Navigator.of(context).push<void>(
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => PartitionViewPage(
                          numeroPartition: cl.numeroImage,
                          titre: titre,
                        ),
                      ),
                    );
                  }
                }
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
            )
          : Container(
              width: 0,
              height: 0,
            ),
    );
  }

  bool isAPartition() {
    bool resultat = false;
    List<CantiqueLangue> cls = cantiques.where((element) => element.langue.code == "ANG").toList();
    if (cls.length > 0) {
      CantiqueLangue cl = cls[0];
      if (cl.numeroImageEstBon) {
        resultat = true;
      }
    }
    return resultat;
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
