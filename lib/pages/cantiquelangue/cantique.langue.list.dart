import 'package:cantiques/_services/cantiquelangue.service.dart';
import 'package:flutter/material.dart';

import '../../_components/icone.partition.dart';
import '../../_models/cantique.langue.model.dart';
import '../../_models/langue.model.dart';
import '../cantique.view.page.dart';
import 'cantique.langue.view.dart';

class CantiqueLangueList extends StatefulWidget {
  final Langue langue;
  const CantiqueLangueList({super.key, required this.langue});

  @override
  State<CantiqueLangueList> createState() => _CantiqueLangueListState();
}

class _CantiqueLangueListState extends State<CantiqueLangueList> {
  List<CantiqueLangue> cantiques = [];
  late TabController tabController;
  bool orderByNumero = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CantiqueLangueService().getAllByLangue(widget.langue).then((values) {
      values.sort(
        (a, b) {
          double premier = double.parse(a.identifiantglobal);
          double second = double.parse(b.identifiantglobal);
          print(premier.toString() + ", " + second.toString());
          return premier >= second ? 1 : -1;
        },
      );
      cantiques = values;
      setState(() {});
    });
  }

  reorder() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade900,
      appBar: AppBar(
        title: Text("Cantiques : " + widget.langue.nom),
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
        ],
      ),
      body: ListView.builder(
        itemCount: cantiques.length,
        itemBuilder: (context, index) {
          CantiqueLangue cantique = cantiques[index];

          return Container(
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
    );
  }

  void _openPage(CantiqueLangue cantique) {
    Navigator.of(context).push<void>(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => CantiqueViewPage(cantique),
      ),
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
