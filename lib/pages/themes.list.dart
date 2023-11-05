import 'package:cantiques/_components/sidemenu.component.dart';
import 'package:flutter/material.dart';

import '../_models/cantique.theme.model.dart';
import '../_models/langue.model.dart';
import '../_services/langue.service.dart';

class ThemeList extends StatefulWidget {
  const ThemeList({super.key});

  @override
  State<ThemeList> createState() => _ThemeListState();
}

class _ThemeListState extends State<ThemeList> with TickerProviderStateMixin {
  late TabController tabController;
  final ScrollController _controller = ScrollController();
  List<Langue> langues = [];
  List<CantiqueTheme> themes = [
    CantiqueTheme.init("Louange et Adoration"),
    CantiqueTheme.init("Naissance de Jésus")
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    langues = LangueService().getAll();
    langues = [
      Langue.init("Fr", "Francais", ""),
      ...langues,
    ];
    tabController = TabController(
      initialIndex: 0,
      length: langues.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade900,
      drawer: MySideMenu(),
      appBar: AppBar(
        title: Text("Thèmes"),
        backgroundColor: Colors.brown.shade900,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
        ],
        bottom: TabBar(
          isScrollable: true,
          controller: tabController,
          indicatorColor: Colors.yellow,
          //indicator: BoxDecoration(color: Colors.yellow, borderRadius: BorderRadius.circular(20)),
          //labelColor: Colors.brown.shade900,
          unselectedLabelColor: Colors.white,
          tabs: langues.map((langue) {
            return Tab(
              text: langue.nom,
            );
          }).toList(),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: ListView.builder(
          controller: _controller,
          itemCount: themes.length,
          itemBuilder: (context, index) {
            CantiqueTheme theme = themes[index];

            return Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: ListTile(
                title: Text(
                  theme.nom,
                  style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.brown.shade900,
                  ),
                ),
                shape: Border(
                  bottom: BorderSide(color: Colors.black12),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
