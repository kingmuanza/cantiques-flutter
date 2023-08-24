import 'package:flutter/material.dart';

import '../_models/cantique.langue.model.dart';
import '../pages/cantiquelangue/cantique.langue.view.dart';
import 'display.cantique.titre.dart';

class CantiquesRecents extends StatelessWidget {
  final List<CantiqueLangue> cantiques;
  const CantiquesRecents({
    Key? key,
    required this.cantiques,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Container(
            width: double.infinity,
            child: Text("Cantiques récemment ouverts"),
          ),
        ),
        Container(
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
    );
  }
}
