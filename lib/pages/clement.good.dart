import 'package:cantiques/_components/sidemenu.component.dart';
import 'package:flutter/material.dart';

class ClementGood extends StatefulWidget {
  const ClementGood({super.key});

  @override
  State<ClementGood> createState() => _ClementGoodState();
}

class _ClementGoodState extends State<ClementGood> {
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
          "Clement Good",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
