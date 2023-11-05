import 'package:cantiques/_components/sidemenu.component.dart';
import 'package:flutter/material.dart';

class MotCoordinatrice extends StatefulWidget {
  const MotCoordinatrice({super.key});

  @override
  State<MotCoordinatrice> createState() => _MotCoordinatriceState();
}

class _MotCoordinatriceState extends State<MotCoordinatrice> {
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
        width: 250,
        child: Text(
          "Mot de la coordinatrice",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
