import 'package:cantiques/_models/langue.model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../_components/sidemenu.component.dart';
import '../_services/langue.service.dart';
import 'cantiquelangue/cantique.langue.list.dart';

class PrefacePage extends StatefulWidget {
  const PrefacePage({super.key});

  @override
  State<PrefacePage> createState() => _PrefacePageState();
}

class _PrefacePageState extends State<PrefacePage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MySideMenu(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.brown.shade900,
        title: Text("Préface"),
        elevation: 0,
      ),
      body: texte(),
    );
  }

  Container texte() {
    String contenu = "";
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(bottom: 16),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: "La mission protestante américaine s’est installée au sud du Cameroun dès son arrivée. "),
                  TextSpan(
                    text: "Elle a évangélisé dans un premiers temps en mettant à la disposition des populations chrétiennes des cantiques en ",
                  ),
                  TextSpan(
                    text: " BULU ",
                    style: TextStyle(
                      color: Colors.brown.shade900,
                      // decoration: TextDecoration.underline,
                      fontSize: 18,
                      backgroundColor: Colors.yellow,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print("Cantiques en Bulu");
                        Navigator.of(context).push<void>(
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => CantiqueLangueList(
                              langue: Langue.init("BULU", "Bulu"),
                            ),
                          ),
                        );
                      },
                  ),
                  TextSpan(
                    text: ". Traduction des cantiques chantés en Amérique.",
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(bottom: 16),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Ces cantiques très populaires ont été radios dans les autres régions d’évangélisation notamment en ",
                  ),
                  TextSpan(
                    text: " bassa ".toUpperCase(),
                    style: TextStyle(
                      color: Colors.brown.shade900,
                      // decoration: TextDecoration.underline,
                      fontSize: 18,
                      backgroundColor: Colors.yellow,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print("Cantiques en Bassa");
                        Navigator.of(context).push<void>(
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => CantiqueLangueList(
                              langue: Langue.init("BASSA", "Bassa"),
                            ),
                          ),
                        );
                      },
                  ),
                  TextSpan(text: ", "),
                  TextSpan(
                    text: " bafia ".toUpperCase(),
                    style: TextStyle(
                      color: Colors.brown.shade900,
                      // decoration: TextDecoration.underline,
                      fontSize: 18,
                      backgroundColor: Colors.yellow,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print("Cantiques en Bafia");
                        Navigator.of(context).push<void>(
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => CantiqueLangueList(
                              langue: Langue.init("BAFIA", "Bafia"),
                            ),
                          ),
                        );
                      },
                  ),
                  TextSpan(text: ", "),
                  TextSpan(
                    text: " douala ".toUpperCase(),
                    style: TextStyle(
                      color: Colors.brown.shade900,
                      // decoration: TextDecoration.underline,
                      fontSize: 18,
                      backgroundColor: Colors.yellow,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print("Cantiques en Douala");
                        Navigator.of(context).push<void>(
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => CantiqueLangueList(
                              langue: Langue.init("DOUALA", "Douala"),
                            ),
                          ),
                        );
                      },
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(bottom: 16),
            child: Text(
              "Nous mettons ici à votre disposition la série des cantiques qui sont traduits et chantés en quatre langue, trois langues et une langue.",
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(bottom: 16),
            child: Text(
              "Vous avez également pour chaque groupe des répartitions pour permettre à celles des régions ou localités qui le Desire de les traduire aussi en leurs langues. ",
            ),
          ),
          Lien(
            texte: "4 langues + partition",
          ),
          Lien(
            texte: "3 langues + partition",
          ),
          Lien(
            texte: "1 langue + partition",
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 16),
            child: Text(
              "Cette application va permettre à beaucoup de chrétiens de se familiariser à nos langues et de louer l’éternel. ",
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 16),
            child: Text(
              "Vous pouvez faire la recherche par ordre alphabétique des chansons dans chaque langue. Aussi faire des recherches par thèmes.",
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 16),
            child: Text(
              "Si ce sont les auteurs des chansons que vous souhaitez connaître vous pouvez cliquer ici.",
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 16),
            child: Text(
              "L’application est téléchargeble sur Google play : Cameroun Cantique Protestant ",
            ),
          ),
        ],
      ),
    );
  }
}

class Lien extends StatelessWidget {
  final String texte;
  const Lien({
    Key? key,
    required this.texte,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 12, top: 12, left: 16, right: 16),
      margin: EdgeInsets.only(bottom: 4, top: 4),
      decoration: BoxDecoration(color: Colors.brown.shade900, borderRadius: BorderRadius.circular(8)),
      child: Text(
        texte,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
