import 'package:cantiques/_models/cantique.model.dart';
import 'package:cantiques/_models/langue.model.dart';
import 'package:cantiques/_providers/cantique.provider.dart';
import 'package:cantiques/_providers/langue.provider.dart';
import 'package:cantiques/_services/cantique.service.dart';
import 'package:cantiques/_services/langue.service.dart';
import 'package:cantiques/pages/cantique.view.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../_components/sidemenu.component.dart';

class FavorisPage extends ConsumerStatefulWidget {
  const FavorisPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FavorisPageState();
}

class _FavorisPageState extends ConsumerState<FavorisPage> with TickerProviderStateMixin {
  late TabController tabController;
  List<Langue> langues = [];
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

    tabController.addListener(
      () {
        var code2 = langues[tabController.index].code;
        print("code de la langue");
        print(code2);
        codeLangue = code2;
        setState(() {});
        ref.read(langueProvider.notifier).update((state) {
          return code2;
        });
      },
    );
  }

  void _openPage(Cantique cantique) {
    Navigator.of(context).push<void>(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => CantiqueViewPage(cantique),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cantiques = ref.watch(cantiqueProvider);
    langues = LangueService().getAll();

    return Scaffold(
      drawer: MySideMenu(),
      appBar: AppBar(
        title: Text("Favoris"),
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
      body: cantiques.when(
        data: (data) {
          List<Cantique> favoris = data.where(
            (element) {
              return CantiqueService().isFavoris(element);
            },
          ).toList();
          return RefreshIndicator(
            onRefresh: () async {
              await refresh();
            },
            child: ListView.builder(
              itemCount: favoris.length,
              itemBuilder: (context, index) {
                Cantique cantique = favoris[index];
                String langue = ref.read(langueProvider);
                return ListTile(
                  title: Text(
                    cantique.getVersion(langue).titre,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.brown.shade900,
                    ),
                  ),
                  subtitle: Text(
                    cantique.compositeur,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  leading: Text(
                    cantique.numero,
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
          );
        },
        error: (error, stackTrace) {
          return Container();
        },
        loading: () {
          return Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
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
