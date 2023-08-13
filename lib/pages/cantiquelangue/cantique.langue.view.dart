import 'package:cantiques/_models/cantique.langue.model.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class CantiqueLangueView extends StatefulWidget {
  final CantiqueLangue cantiqueLangue;
  const CantiqueLangueView({super.key, required this.cantiqueLangue});

  @override
  State<CantiqueLangueView> createState() => _CantiqueLangueViewState();
}

class _CantiqueLangueViewState extends State<CantiqueLangueView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.cantiqueLangue.titre),
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
      body: Padding(
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
                if (widget.cantiqueLangue.refrain != null && widget.cantiqueLangue.refrain != "") {
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

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          CircularProgressIndicator(),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 16),
              child: Text("Rechercher dans d'autres langues..."),
            ),
          ),
        ],
      ),
    );
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
