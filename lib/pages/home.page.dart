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

    CantiqueLangueService().getAll().then((all) {
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
        title: Text("Cantiques"),
        backgroundColor: Colors.brown.shade900,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: CantiqueSearchDelegate([]),
              );
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              refresh();
            },
            icon: Icon(Icons.refresh),
          ),
        ],
        bottom: TabBar(
          isScrollable: true,
          indicatorColor: Colors.yellow,
          controller: tabController,
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
                    fontSize: 16,
                    color: Colors.brown.shade900,
                  ),
                ),
                /* subtitle: Text(
                      cantique.compositeur,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ), */
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

  Future<void> refresh() async {
    CantiqueLangueService().getAll().then((all) {
      cantiques = all;
      codeLangue = langues[0].code;
      cantiquesByLangues = cantiques.where(
        (element) {
          return element.langue.code == codeLangue;
        },
      ).toList();
    });
  }
}

class CantiqueSearchDelegate extends SearchDelegate {
  List<Cantique> cantiques = [];
  CantiqueSearchDelegate(List<Cantique> all) {
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
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile();
        },
      ),
    );
  }
}
