import 'dart:convert';

import 'package:cantiques/_models/cantique.langue.model.dart';
import 'package:cantiques/_models/langue.model.dart';
import 'package:cantiques/_services/cantiquelangue.service.dart';
import 'package:cantiques/_services/langue.service.dart';
import 'package:cantiques/pages/cantique.view.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../_components/icone.partition.dart';
import '../_components/sidemenu.component.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> with TickerProviderStateMixin {
  late TabController tabController;
  final ScrollController _controller = ScrollController();
  List<Langue> langues = [];
  List<CantiqueLangue> cantiques = [];
  List<CantiqueLangue> cantiquesByLangues = [];
  String codeLangue = "FR";
  bool startAnimation = false;
  List<bool> startAnimations = [];

  bool orderByNumero = true;
  bool asc = true;

  GlobalKey<TooltipState> toolTipKey = GlobalKey<TooltipState>();

  @override
  void initState() {
    super.initState();
    langues = LangueService().getAll();
    langues.forEach((element) {
      startAnimations.add(false);
    });
    tabController = TabController(
      initialIndex: 0,
      length: langues.length,
      vsync: this,
    );

    CantiqueLangueService().getAll(orderByNumero: orderByNumero).then((all) {
      cantiques = all;
      codeLangue = langues[0].code;
      cantiquesByLangues = cantiques.where(
        (element) {
          return element.langue.code == codeLangue;
        },
      ).toList();

      Future.delayed(
        Duration(milliseconds: 300),
        () {
          startAnimations[0] = true;
          setState(() {});
        },
      );
      setState(() {});
    });

    tabController.addListener(
      () {
        startAnimations[tabController.index] = false;
        setState(() {});
        _scrollUp();

        Future.delayed(
          Duration(milliseconds: 1000),
          () {
            var code2 = langues[tabController.index].code;
            codeLangue = code2;
            cantiquesByLangues = cantiques.where(
              (element) {
                return element.langue.code == codeLangue;
              },
            ).toList();
            startAnimations[tabController.index] = true;
            setState(() {});
          },
        );
      },
    );
  }

  refresh() async {
    List<CantiqueLangue> all = await CantiqueLangueService().getAll(orderByNumero: orderByNumero);

    cantiques = all;
    codeLangue = langues[0].code;
    cantiquesByLangues = cantiques.where(
      (element) {
        return element.langue.code == codeLangue;
      },
    ).toList();

    Future.delayed(
      Duration(milliseconds: 300),
      () {
        startAnimations[0] = true;
        setState(() {});
      },
    );
    setState(() {});
  }

  void _scrollUp() {
    _controller.animateTo(
      0.0,
      duration: Duration(milliseconds: 100),
      curve: Curves.fastOutSlowIn,
    );
  }

  void _openPage(CantiqueLangue cantique) {
    Navigator.of(context).push<void>(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => CantiqueViewPage(cantique),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade900,
      drawer: MySideMenu(),
      appBar: AppBar(
        title: Text(
          "Cantiques",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(
          color: Colors.white, // Couleur des icônes de l'AppBar
        ),
        backgroundColor: Colors.brown.shade900,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: CantiqueSearchDelegate(cantiques, langues[tabController.index]),
              );
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              // refresh();
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) {
                  return StatefulBuilder(
                    builder: (context, snapshot) {
                      return Container(
                        height: 260,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                        ),
                        child: ListView(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: ListTile(
                                title: Text(
                                  "Ordre des cantiques",
                                  style: TextStyle(color: Colors.grey.shade700),
                                ),
                              ),
                            ),
                            ListTile(
                              leading: orderByNumero
                                  ? Icon(
                                      Icons.radio_button_checked,
                                      color: Colors.brown.shade900,
                                    )
                                  : Icon(Icons.radio_button_off),
                              title: Text("Ordonner par numéro"),
                              onTap: () async {
                                orderByNumero = true;
                                snapshot(() {});
                                await refresh();
                                Navigator.of(context).pop();
                              },
                            ),
                            ListTile(
                              leading: orderByNumero
                                  ? Icon(
                                      Icons.radio_button_checked,
                                      color: Colors.brown.shade900,
                                    )
                                  : Icon(Icons.radio_button_off),
                              title: Text("Ordonner par thème"),
                              onTap: () async {
                                orderByNumero = true;
                                snapshot(() {});
                                await refresh();
                                Navigator.of(context).pop();
                              },
                            ),
                            ListTile(
                              leading: !orderByNumero
                                  ? Icon(
                                      Icons.radio_button_checked,
                                      color: Colors.brown.shade900,
                                    )
                                  : Icon(Icons.radio_button_off),
                              title: Text("Ordonner par titre"),
                              onTap: () async {
                                orderByNumero = false;
                                snapshot(() {});
                                await refresh();
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              );
            },
            icon: Icon(Icons.sort_by_alpha_outlined),
          ),
        ],
        bottom: TabBar(
          isScrollable: true,
          controller: tabController,
          indicatorColor: Colors.yellow,
          labelColor: Colors.yellow,
          //indicator: BoxDecoration(color: Colors.yellow, borderRadius: BorderRadius.circular(20)),
          //labelColor: Colors.brown.shade900,
          unselectedLabelColor: Colors.white,
          tabs: langues.map((langue) {
            return Tab(
              text: langue.nom,
            );
          }).toList(),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await refresh();
        },
        child: ListView.builder(
          controller: _controller,
          itemCount: cantiquesByLangues.length,
          itemBuilder: (context, index) {
            CantiqueLangue cantique = cantiquesByLangues[index];
            return AnimatedContainer(
              duration: Duration(milliseconds: 300 + index * 50),
              curve: Curves.easeInOut,
              transform: Matrix4.translationValues(startAnimations[tabController.index] ? 0 : MediaQuery.of(context).size.width, 0, 0),
              // height: 65,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 0),
              child: ListTile(
                dense: true,
                title: Text(
                  cantique.titre,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.brown.shade900,
                    height: 1.15,
                  ),
                ),
                subtitle: Text(
                  cantique.others,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Colors.brown.shade900,
                    height: 1.15,
                  ),
                ),
                leading: !(cantique.langue.code == "ANG" || cantique.identifiantlocal.trim() == "0")
                    ? Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Text(
                            cantique.identifiantlocal,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    : Container(
                        width: 0,
                        height: 0,
                      ),
                trailing: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Text(
                      cantique.identifiantglobal,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  _openPage(cantique);
                },
              ),
            );
          },
        ),
      ),
      /* floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: Colors.yellow,
        ),
        backgroundColor: Colors.brown.shade900,
      ), */
    );
  }
}

class CantiqueSearchDelegate extends SearchDelegate {
  List<CantiqueLangue> cantiques = [];
  Langue langue = Langue();

  CantiqueSearchDelegate(List<CantiqueLangue> all, Langue l) {
    cantiques = all;
    langue = l;
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
    List<CantiqueLangue> resultats = cantiques.where(
      (element) {
        bool obligatoire = langue.code == element.langue.code;
        bool b1 = element.titre.toLowerCase().indexOf(query) != -1;
        bool b2 = element.brut.toLowerCase().indexOf(query) != -1;
        bool b3 = element.identifiantglobal.toLowerCase().indexOf(query) != -1 && langue.code == element.langue.code;
        return obligatoire && (b1 || b2 || b3);
      },
    ).toList();
    return Container(
      child: ListView.builder(
        itemCount: resultats.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Container(
              height: 80,
              width: double.infinity,
              color: Colors.grey.shade300,
              padding: EdgeInsets.all(16),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      "Langue : " + langue.nom,
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      "${resultats.length} résultats",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            );
          }
          CantiqueLangue cantique = resultats[index - 1];
          LineSplitter ls = LineSplitter();
          List<String> subtitles = ls.convert(cantique.brut);
          String subtitle = "";

          bool b1 = cantique.titre.toLowerCase().indexOf(query) != -1 && query.trim().length > 0;
          bool b2 = cantique.brut.toLowerCase().indexOf(query) != -1 && query.trim().length > 0;
          bool b3 = cantique.identifiantglobal.toLowerCase().indexOf(query) != -1 && query.trim().length > 0;
          if (query.length > 0)
            subtitles.forEach((element) {
              if (element.indexOf(query) != -1) {
                if (element.length > 25) subtitle = element.substring(0, 25);
              }
            });
          return ListTile(
            title: Text(
              cantique.titre,
              style: TextStyle(
                // fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.brown.shade900,
                backgroundColor: b1 ? Colors.yellow : Colors.transparent,
              ),
            ),
            subtitle: Text(
              subtitle,
              style: TextStyle(
                  // fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.brown.shade900,
                  backgroundColor: b2 ? Colors.yellow : Colors.transparent),
            ),
            leading: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: b3 ? Colors.yellow : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(
                  cantique.identifiantlocal != "0" ? cantique.identifiantlocal : "",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            trailing: cantique.numeroImageEstBon
                ? IconePartition()
                : Container(
                    height: 0,
                    width: 0,
                  ),
            shape: Border(
              bottom: BorderSide(color: Colors.black12),
            ),
            onTap: () {
              Navigator.of(context).push<void>(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => CantiqueViewPage(cantique),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
