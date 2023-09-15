import 'package:cantiques/_services/cantiquelangue.service.dart';
import 'package:flutter/material.dart';

import '../../_models/cantique.langue.model.dart';
import '../../_models/langue.model.dart';
import 'cantique.langue.view.dart';

class CantiqueLangueList extends StatefulWidget {
  final Langue langue;
  const CantiqueLangueList({super.key, required this.langue});

  @override
  State<CantiqueLangueList> createState() => _CantiqueLangueListState();
}

class _CantiqueLangueListState extends State<CantiqueLangueList> {
  List<CantiqueLangue> cantiques = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CantiqueLangueService().getAllByLangue(widget.langue).then((values) {
      values.sort(
        (a, b) {
          return a.getScore() - b.getScore() > 0 ? -1 : 1;
        },
      );
      cantiques = values;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cantiques : " + widget.langue.nom),
        backgroundColor: Colors.brown.shade900,
      ),
      body: ListView.builder(
        itemCount: cantiques.length,
        itemBuilder: (context, index) {
          CantiqueLangue cantique = cantiques[index];
          return ListTile(
            title: Text(
              cantique.titre,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.brown.shade900,
              ),
            ),
            subtitle: Text(
              cantique.getRefs(),
            ),
            dense: true,
            trailing: Icon(
              Icons.chevron_right,
              color: Colors.grey.shade400,
            ),
            leading: Container(
              width: 50,
              height: 50,
              color: Colors.yellow.shade800,
              child: Center(
                child: Text(
                  cantique.identifiantglobal,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            onTap: () {
              Navigator.of(context).push<void>(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => CantiqueLangueView(
                    cantiqueLangue: cantique,
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
