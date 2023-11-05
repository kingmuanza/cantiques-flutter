import 'package:cantiques/_components/sidemenu.component.dart';
import 'package:flutter/material.dart';

class MadameCozzens extends StatefulWidget {
  const MadameCozzens({super.key});

  @override
  State<MadameCozzens> createState() => _MadameCozzensState();
}

class _MadameCozzensState extends State<MadameCozzens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: MySideMenu(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.brown.shade900,
        title: Text(""),
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.only(bottom: 24, left: 16),
        width: 300,
        child: Text(
          "Madame Cozzens",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
