import 'package:cantiques/_models/langue.model.dart';
import 'package:flutter/material.dart';

import '../_components/sidemenu.component.dart';
import '../_services/langue.service.dart';

class PrefacePage extends StatefulWidget {
  const PrefacePage({super.key});

  @override
  State<PrefacePage> createState() => _PrefacePageState();
}

class _PrefacePageState extends State<PrefacePage> with TickerProviderStateMixin {
  late TabController tabController;
  List<Langue> langues = [];
  String codeLangue = "FR";

  @override
  void initState() {
    super.initState();
    langues = LangueService().getAll();
    tabController = TabController(
      initialIndex: 0,
      length: langues.length,
      vsync: this,
    );

    tabController.addListener(
      () {
        var code2 = langues[tabController.index].code;
        print("code de la langue");
        print(code2);
        codeLangue = code2;
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MySideMenu(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.brown,
        title: Text("Préface"),
        elevation: 0,
        bottom: TabBar(
          isScrollable: true,
          labelColor: Colors.brown,
          controller: tabController,
          tabs: langues.map((langue) {
            print("langue");
            print(langue.toJSON());
            return Tab(
              text: langue.nom,
            );
          }).toList(),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          texte(),
          texte(),
          texte(),
          texte(),
          texte(),
        ],
      ),
    );
  }

  Container texte() {
    return Container(
      padding: EdgeInsets.all(24),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(bottom: 24),
            child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nec dapibus lorem. Nunc vitae nulla quis metus aliquam viverra. Proin sit amet imperdiet dolor, eget tempus dolor. Nulla efficitur orci nec porttitor congue. Nunc venenatis metus elementum, ultrices ligula aliquet, porta nunc. Nam non quam at enim pretium pellentesque at a nulla. Nulla facilisi. Etiam non ullamcorper arcu. Nullam semper ante erat. In a ipsum tellus. Maecenas eu suscipit ex, et posuere libero. In pellentesque libero sapien, eu imperdiet eros volutpat at. Praesent sit amet ex aliquet, rutrum augue pharetra, volutpat velit. Aenean molestie tincidunt risus. Ut ullamcorper erat et urna laoreet tristique."),
          ),
          Container(
            width: double.infinity,
            child: Text(
                " Proin sit amet imperdiet dolor, eget tempus dolor. Nulla efficitur orci nec porttitor congue. Nunc venenatis metus elementum, ultrices ligula aliquet, porta nunc. Nam non quam at enim pretium pellentesque at a nulla. Nulla facilisi. Etiam non ullamcorper arcu. Nullam semper ante erat. In a ipsum tellus. Maecenas eu suscipit ex, et posuere libero. In pellentesque libero sapien, eu imperdiet eros volutpat at. Praesent sit amet ex aliquet, rutrum augue pharetra, volutpat velit. Aenean molestie tincidunt risus. Ut ullamcorper erat et urna laoreet tristique."),
          ),
        ],
      ),
    );
  }
}
