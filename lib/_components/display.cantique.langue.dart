import 'package:flutter/material.dart';
import 'dart:math';
import '../_models/cantique.langue.model.dart';

class DisplayCantiqueLangue extends StatelessWidget {
  const DisplayCantiqueLangue({
    Key? key,
    required this.cantiqueLangue,
  }) : super(key: key);

  final CantiqueLangue cantiqueLangue;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 0.0),
        child: Column(
          children: List.generate(
            cantiqueLangue.couplets.length + 1,
            (index) {
              if (index != 1) {
                String couplet = cantiqueLangue.couplets[max(index - 1, 0)];
                return Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(
                    top: index == 0 ? 16.0 : 8,
                    bottom: 4,
                  ),
                  child: Text(
                    couplet.replaceAll("\t", " ").trim(),
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                );
              } else {
                if (cantiqueLangue.refrain != null && cantiqueLangue.refrain != "") {
                  return Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(
                      top: 4,
                      bottom: 4,
                    ),
                    child: Text(
                      cantiqueLangue.refrain.trim(),
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
    );
  }
}
