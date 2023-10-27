import 'package:cantiques/_models/cantique.langue.model.dart';
import 'package:cantiques/_models/cantique.model.dart';
import 'package:cantiques/_models/langue.model.dart';
import 'package:cantiques/_providers/cantique.provider.dart';
import 'package:cantiques/_providers/langue.provider.dart';
import 'package:cantiques/_services/cantiquelangue.service.dart';
import 'package:cantiques/_services/langue.service.dart';
import 'package:cantiques/pages/cantique.view.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../_components/icone.partition.dart';

class CantiqueByNumber extends ConsumerStatefulWidget {
  final int nombre;
  const CantiqueByNumber(this.nombre, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CantiqueByNumberState();
}

class _CantiqueByNumberState extends ConsumerState<CantiqueByNumber> with TickerProviderStateMixin {
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

    showAndCloseTooltip();

    CantiqueLangueService().getAllByNombre(widget.nombre, orderByNumero: orderByNumero).then((all) {
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

  Future showAndCloseTooltip() async {
    print("showAndCloseTooltip");
    await Future.delayed(Duration(milliseconds: 10));
    toolTipKey.currentState!.ensureTooltipVisible();
    await Future.delayed(Duration(seconds: 4));
    print("showed showAndCloseTooltip");
    toolTipKey.currentState!.deactivate();
  }

  refresh() async {
    List<CantiqueLangue> all = await CantiqueLangueService().getAllByNombre(widget.nombre, orderByNumero: orderByNumero);

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
      appBar: AppBar(
        title: Tooltip(
          key: toolTipKey,
          message: "Choisissez la langue qui vous convient",
          verticalOffset: 78,
          height: 60,
          child: Text(
            "${widget.nombre} Cantiques + partition",
          ),
        ),
        backgroundColor: Colors.brown.shade900,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: CantiqueSearchDelegate(cantiques),
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
                        height: 200,
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
            String langue = ref.read(langueProvider);
            return AnimatedContainer(
              duration: Duration(milliseconds: 300 + index * 50),
              curve: Curves.easeInOut,
              transform: Matrix4.translationValues(startAnimations[tabController.index] ? 0 : MediaQuery.of(context).size.width, 0, 0),
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: ListTile(
                title: Text(
                  cantique.titre,
                  style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.brown.shade900,
                  ),
                ),
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text(
                      cantique.identifiantglobal,
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
  CantiqueSearchDelegate(List<CantiqueLangue> all) {
    cantiques = all;
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
        return element.titre.toLowerCase().indexOf(query) != -1;
      },
    ).toList();
    return Container(
      child: ListView.builder(
        itemCount: resultats.length,
        itemBuilder: (context, index) {
          CantiqueLangue cantique = resultats[index];
          return ListTile(
            title: Text(
              cantique.titre,
              style: TextStyle(
                // fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.brown.shade900,
              ),
            ),
            leading: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(
                  cantique.identifiantglobal,
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
