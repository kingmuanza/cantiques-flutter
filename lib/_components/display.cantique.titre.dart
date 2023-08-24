import 'package:flutter/material.dart';

import '../_models/cantique.langue.model.dart';

class DisplayCantiqueTitre extends StatelessWidget {
  const DisplayCantiqueTitre({
    Key? key,
    required this.cantique,
  }) : super(key: key);

  final CantiqueLangue cantique;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8.0),
      padding: const EdgeInsets.all(12.0),
      color: Colors.brown.shade900,
      height: 200,
      width: 150,
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                cantique.titre,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.symmetric(
              vertical: 4.0,
              horizontal: 12.0,
            ),
            height: 30,
            color: Colors.yellow.shade800,
            child: Center(
              child: Text(
                cantique.langue.nom,
                style: TextStyle(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
