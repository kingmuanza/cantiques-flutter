import 'package:cantiques/_components/sidemenu.component.dart';
import 'package:flutter/material.dart';

class MotCoordinatrice extends StatefulWidget {
  const MotCoordinatrice({super.key});

  @override
  State<MotCoordinatrice> createState() => _MotCoordinatriceState();
}

class _MotCoordinatriceState extends State<MotCoordinatrice> {
  List<String> textes = [
    "L’honneur m’échoit de vous présenter ce recueil de cantiques. Fruit d’un travail collectif exigeant et minutieux. Résultat d’une mise en forme d’un tri attentif de multiples versions et textes.",
    "En tant que fille de pasteur, j’ai ressenti l’importance de rassembler les cantiques traduits par les missionnaires et de nombreux ecclésiastiques camerounais en bulu dans un premier temps (BIA YA KAÑE ZAMBE), tirés des cantiques chantés dans les églises protestantes américaines. Ensuite en bassa, puis en bafia et en duala, afin de répondre aux attentes des fidèles.",
    "Sur ce chemin, une opportune convergence de vue m’a rapproché d’un mécène ayant le même souci. Son grand-père était catéchiste, ses parents de fervents chrétiens ayant pris une part très active dans l’expansion des Églises protestantes en pays bulu au Sud du Cameroun. Il a partagé mon rêve et a décidé de devenir partie prenante dans ce projet. Je lui en suis très reconnaissante.",
    "Formant un tandem dans ce parcours, nous avons mutualisé nos visions et réflexions pour produire ce recueil qui, nous l’espérons de tout cœur, sera une bénédiction pour de nombreuses personnes dans la consolidation de leurs parcours spirituels.",
    "Ce recueil est bien plus qu’un simple assemblage de cantiques. Il est le reflet de notre diversité culturelle et linguistique, ainsi que notre unité dans la Foi.",
    "Chaque cantique, qu’il soit en bulu, en bassa, en bafia, ou en duala, est une prière vibrante, une communion avec notre Dieu.",
    "En parcourant ces pages, vous découvrirez la richesse des expressions de foi dans chacune de ces langues. Nous avons rassemblé à partir des cantiques bulu, les partitiions correspondantes et pour chaque cantique indiqué, ceux qu'on a retrouvés en bassa, en bafia et en duala pour permettre aux locuteurs d’autres langues locales de se les approprier.",
    "Que ces cantiques apaisent vos cœurs, nourrissent et consolent vos âmes, vous inspirent et vous poussent à partager la Bonne Nouvelle avec passion, compassion et zèle.",
    "Je tiens à exprimer ma profonde gratitude à tous ceux qui ont contribué à la réalisation de ce projet. C’est grâce à leur dévouement et à leur abnégation que cet ouvrage a pris cette forme.",
    "Que les chants religieux soient une source d’inspiration et de réconfort pour nous tous. Que chaque cantique résonne dans nos cœurs et nous rapproche de Dieu. Nous rappelant son infini amour et sa présence dans nos vies.",
    "Pauline BIYONG",
    "",
    "",
    "",
  
  ];
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 24),
              width: 250,
              child: Text(
                "Mot de la coordinatrice",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, height: 1.15),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              width: double.infinity,
              child: Text(
                textes[0],
                textAlign: TextAlign.justify,
                style: TextStyle(
                  height: 1.15,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              width: double.infinity,
              child: Text(
                textes[1],
                textAlign: TextAlign.justify,
                style: TextStyle(height: 1.15),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              width: double.infinity,
              child: Text(
                textes[2],
                textAlign: TextAlign.justify,
                style: TextStyle(height: 1.15),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              width: double.infinity,
              child: Text(
                textes[3],
                textAlign: TextAlign.justify,
                style: TextStyle(height: 1.15),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              width: double.infinity,
              child: Text(
                textes[4],
                textAlign: TextAlign.justify,
                style: TextStyle(height: 1.15),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              width: double.infinity,
              child: Text(
                textes[5],
                textAlign: TextAlign.justify,
                style: TextStyle(height: 1.15),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              width: double.infinity,
              child: Text(
                textes[6],
                textAlign: TextAlign.justify,
                style: TextStyle(height: 1.15),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              width: double.infinity,
              child: Text(
                textes[7],
                textAlign: TextAlign.justify,
                style: TextStyle(height: 1.15),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              width: double.infinity,
              child: Text(
                textes[8],
                textAlign: TextAlign.justify,
                style: TextStyle(height: 1.15),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              width: double.infinity,
              child: Text(
                textes[9],
                textAlign: TextAlign.justify,
                style: TextStyle(height: 1.15),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              width: double.infinity,
              child: Text(
                textes[10],
                textAlign: TextAlign.justify,
                style: TextStyle(height: 1.15),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              width: double.infinity,
              child: Text(
                textes[11],
                textAlign: TextAlign.justify,
                style: TextStyle(height: 1.15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
