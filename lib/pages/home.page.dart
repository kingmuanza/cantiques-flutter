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
  List<Langue> langues = [];
  List<CantiqueLangue> cantiques = [];
  List<CantiqueLangue> cantiquesByLangues = [];
  String codeLangue = "FR";

  @override
  void initState() {
    super.initState();
    langues = LangueService().getAll();
    tabController = TabController(
      initialIndex: 0,
      length: langues.length,
      vsync: this,
    );

    CantiqueLangueService().getAll().then((all) {
      cantiques = all;
    });

    tabController.addListener(
      () {
        var code2 = langues[tabController.index].code;
        print("code de la langue");
        print(code2);
        codeLangue = code2;
        cantiquesByLangues = cantiques.where(
          (element) {
            return element.langue.code == codeLangue;
          },
        ).toList();
        setState(() {});
      },
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
          controller: tabController,
          tabs: langues.map((langue) {
            print("langue");
            print(langue.toJSON());
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
          itemCount: cantiquesByLangues.length,
          itemBuilder: (context, index) {
            CantiqueLangue cantique = cantiquesByLangues[index];
            String langue = ref.read(langueProvider);
            return ListTile(
              title: Text(
                cantique.titre,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.brown.shade900,
                ),
              ),
              /* subtitle: Text(
                    cantique.compositeur,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ), */
              leading: Text(
                cantique.identifiantglobal,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              shape: Border(
                bottom: BorderSide(color: Colors.black12),
              ),
              onTap: () {
                _openPage(cantique);
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.brown.shade900,
      ),
    );
  }

  Future<void> refresh() async {
    var newVariable = await ref.refresh(cantiqueProvider);
    var newVariable3 = await ref.refresh(langueProvider);
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
