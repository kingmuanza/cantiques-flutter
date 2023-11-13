import 'package:cantiques/_models/cantique.langue.model.dart';
import 'package:cantiques/_services/cantiquelangue.service.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import '../../_components/display.cantique.titre.dart';

class CantiqueLangueView extends StatefulWidget {
  final CantiqueLangue cantiqueLangue;
  const CantiqueLangueView({super.key, required this.cantiqueLangue});

  @override
  State<CantiqueLangueView> createState() => _CantiqueLangueViewState();
}

class _CantiqueLangueViewState extends State<CantiqueLangueView> {
  List<CantiqueLangue> cantiques = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getOtherVersions().then(() {});
  }

  getOtherVersions() async {
    CantiqueLangueService().getAllCantiqueInOthersLangues(widget.cantiqueLangue).then((values) {
      cantiques = values;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.cantiqueLangue.titre),
        backgroundColor: Colors.brown.shade900,
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Enregistré dans votre téléphone'),
                ),
              );
            },
            icon: Icon(Icons.download),
          ),
          IconButton(
            onPressed: () {
              showLoaderDialog(context);
            },
            icon: Icon(Icons.translate),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: List.generate(
                  widget.cantiqueLangue.couplets.length + 1,
                  (index) {
                    if (index != 1) {
                      String couplet = widget.cantiqueLangue.couplets[max(index - 1, 0)];
                      return Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(
                          top: index == 0 ? 16.0 : 8,
                          bottom: 8,
                        ),
                        child: Text(
                          couplet.replaceAll("\t", " ").trim(),
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      );
                    } else {
                      if (widget.cantiqueLangue.refrain != "") {
                        return Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(
                            top: 8,
                            bottom: 8,
                          ),
                          child: Text(
                            widget.cantiqueLangue.refrain.trim(),
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
                ),
              ),
            ),
            if (cantiques.length > 0)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
                color: Colors.grey.shade200,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      child: Text("Disponible dans d'autres langues"),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 20.0, left: 0),
                      height: 208,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: ListView.builder(
                          itemCount: cantiques.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            CantiqueLangue cl = cantiques[index];
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push<void>(
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) => CantiqueLangueView(
                                      cantiqueLangue: cl,
                                    ),
                                  ),
                                );
                              },
                              child: DisplayCantiqueTitre(cantique: cl),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  showLoaderDialog(BuildContext contexter) {
    getOtherVersions().then(() {});
  }
}
