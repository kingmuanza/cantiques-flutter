import 'package:cantiques/_components/sidemenu.component.dart';
import 'package:flutter/material.dart';

class Mecene extends StatefulWidget {
  const Mecene({super.key});

  @override
  State<Mecene> createState() => _MeceneState();
}

class _MeceneState extends State<Mecene> {
  List<String> textes = [
    "",
    "",
    "",
    "",
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/mvondoayolo.png"), // Remplacez par le chemin de votre image
              fit: BoxFit.cover, // Couvre tout l'arrière-plan
            ),
          ),
          child: Container(
            color: Colors.white.withOpacity(0.5),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          drawer: MySideMenu(),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.brown.shade900,
            title: Text(""),
            elevation: 0,
          ),
          body: Container(
            // Utilisation de BoxDecoration pour définir l'image en arrière-plan

            child: Container(
              child: Center(
                // Votre contenu ici
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Samuel \nMVONDO AYOLO, \nLe Mécène,\n",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26, height: 1.15),
                        ),
                        TextSpan(
                          text:
                              "\nest le petit fils du catéchiste Jean MVONDO AYOLO sur la photo à droite, fils de Moïse MVONDO AYOLO sur la photo à gauche, grand opérateur économique qui fût l'une des plus efficientes chevilles ouvrières de l’évangélisation du Sud Cameroun",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
