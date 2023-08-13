import 'package:flutter/material.dart';

import '../_components/sidemenu.component.dart';

class ParametresPage extends StatefulWidget {
  const ParametresPage({super.key});

  @override
  State<ParametresPage> createState() => _ParametresPageState();
}

class _ParametresPageState extends State<ParametresPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MySideMenu(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.brown,
        title: Text("Paramètres"),
        elevation: 0,
      ),
    );
  }
}
