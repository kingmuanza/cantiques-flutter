import 'package:flutter/material.dart';
import 'dart:math';
import '../_models/cantique.langue.model.dart';

class DisplayCantiqueLangue extends StatefulWidget {
  const DisplayCantiqueLangue({
    Key? key,
    required this.cantiqueLangue,
  }) : super(key: key);

  final CantiqueLangue cantiqueLangue;

  @override
  State<DisplayCantiqueLangue> createState() => _DisplayCantiqueLangueState();
}

class _DisplayCantiqueLangueState extends State<DisplayCantiqueLangue> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: List.generate(
            widget.cantiqueLangue.couplets.length + 1,
            (index) {
              if (index != 1) {
                String couplet =
                    widget.cantiqueLangue.couplets[max(index - 1, 0)];
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
    );
  }
}
