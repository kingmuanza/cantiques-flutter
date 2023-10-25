import 'package:cantiques/pages/home.page.dart';
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
          padding: const EdgeInsets.only(top: 32.0, bottom: 8),
          child: Container(
            width: double.infinity,
            child: Text(
              "Nos cantiques sont classés en 4 catégories",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black.withOpacity(0.7),
              ),
            ),
          ),
        ),
        Container(
          height: 196,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push<void>(
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => HomePage(),
                      ),
                    );
                  },
                  child: Container(
                    height: 160,
                    width: 130,
                    margin: EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      color: Colors.brown.shade900.withOpacity(1 - index * 0.05),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        "${4 - index}",
                        style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 70,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Container(
            width: double.infinity,
            child: Text(
              "Ce découpage provient de nos recherches qui nous ont permises de classer nos cantiques par groupe, en fonction des traductions obtenues",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black.withOpacity(0.7),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
