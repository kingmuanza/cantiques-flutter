import 'package:cantiques/_models/cantique.langue.model.dart';
import 'package:cantiques/_services/cantiquelangue.service.dart';
import 'package:flutter/material.dart';

import '../../_models/compositeur.model.dart';

class CompositeurViewPage extends StatefulWidget {
  final Compositeur compositeur;
  const CompositeurViewPage({super.key, required this.compositeur});

  @override
  State<CompositeurViewPage> createState() => _CompositeurViewPageState();
}

class _CompositeurViewPageState extends State<CompositeurViewPage> {
  List<CantiqueLangue> cantiques = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CantiqueLangueService()
        .getAllByCompositeur(widget.compositeur)
        .then((values) {
      cantiques = values;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade900,
      appBar: AppBar(
        title: Text(widget.compositeur.nom),
        backgroundColor: Colors.brown.shade900,
      ),
      body: ListView.builder(
        itemCount: cantiques.length,
        itemBuilder: (context, index) {
          CantiqueLangue cantique = cantiques[index];
          return Container(
            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.brown.shade900,
              ),
              title: Text(cantique.titre),
              trailing: Icon(
                Icons.star_outline_sharp,
                color: Colors.yellow,
              ),
            ),
          );
        },
      ),
    );
  }
}
