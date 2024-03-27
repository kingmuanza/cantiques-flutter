import 'package:cantiques/_components/sidemenu.component.dart';
import 'package:flutter/material.dart';

class MadameCozzens extends StatefulWidget {
  const MadameCozzens({super.key});

  @override
  State<MadameCozzens> createState() => _MadameCozzensState();
}

class _MadameCozzensState extends State<MadameCozzens> {
  List<String> textes = [
    "Lucia Hammond épouse Cozzens était d’origine allemande et avait pour époux Edwin Cozzens, un ingénieur américain. C’est en 1919 que le couple Cozzens arriva au Cameroun, dans le cadre d’un accord signé aux Etats-Unis entre l’Etat fédéral et la PC/USA (presbyterian church in USA).",
    "Selon les termes de cet accord, le gouvernement fédéral, alors dirigé par Woodrow Wilson, mettait à la disposition de la MPA (Mission presbytérienne américaine), via la PC/USA, certains cadres et techniciens de l’armée américaine démobilisés après la campagne victorieuse de l’Europe qui, de 1917-1918, avait permis de mettre fin à la première Guerre Mondiale. Comme on peut l’imaginer, cet accord avait un double avantage. D’abord, il a permis au gouvernement américain de caser un certain nombre de ses anciens soldats, dont la réinsertion dans la vie civile aurait peut-être été difficile après la guerre. Ensuite, il a mis à la disposition de la MPA des cadres et des techniciens de haut niveau, au moment où cette mission s’engageait dans une vaste entreprise de construction des stations et de développement des œuvres sociales.",
    "C’est donc dans le cadre de cet accord que les Cozzens arrivèrent au Cameroun. Ils furent affectés à la station d’Elat, alors centre pilote de la MPA au Cameroun. Ingénieur polyvalent, Edwin Cozzens fut le bâtisseur principal de la plupart des infrastructures de la station d’Elat. L’administration française ne manquait d’ailleurs pas de profiter de ses compétences lors des travaux de construction dans le N’tem. De même, de temps en temps, Edwin Cozzens allait effectuer des travaux de génie civil au Rio Muni, à la demande des autorités espagnoles. C’est dire à quel point cet ingénieur américain était devenu utile, aussi bien pour la MPA que pour les autorités administratives françaises et les autorités espagnoles.",
    "De son côté, Mme Cozzens n’était pas inactive. Femme d’une extraordinaire beauté, son physique presque parfait lui a valu le surnom d’Okonobeng (beauté excessive) par les Bulu sitôt le couple installé à Elat.",
    "Dès leur arrivée, on confia à Mme Cozzens la gestion de la trésorerie d’Elat. Pendant plus d’une décennie, ce fut sa fonction principale au secrétariat de la mission. Tous les problèmes relatifs à la paie des employés, aux entrées et sorties d’argent, reposaient sur sa personnalité. C’est dire à quel point cette dame avait de très lourdes responsabilités. En 1925, parallèlement à la trésorerie, Mme Cozzens commença à rassembler les femmes au sein de la MPA. Au niveau de la station, elle créa une école d’apprentissage pour les femmes des collaborateurs camerounais en service à Elat. Dans cette école, elle leur apprenait à lire, coudre, broder, et à tricoter. En plus, elle leur dispensait des enseignements ménagers centrés sur le bon entretien du foyer et le comportement d’une «femme chrétienne». Au niveau de la MPA en général, Mme Cozzens était aussi très entreprenante. C’est ainsi qu’elle organisa dès 1925 l’assemblée des femmes chrétiennes, plus connue sous son appellation bulu de Nsamba Binga. Elle procéda également à la traduction de nombreux cantiques, dont certains furent consignés dans le recueil Bia ya kaὴe Zambe.(Chansons pour adorer Dieu).",
    "En 1928, Mme Cozzens quitta la trésorerie pour prendre la direction de toutes les écoles MPA de la région du N’tem. La même année, elle remplaça le Pasteur Johnston à la tête du journal Mefoé (les nouvelles), une publication éditée en langue bulu depuis 1910 à Elat. Cette prise en main de Mefoé s’accompagna d’une orientation de ses articles dans le sens de l’exaltation du nationalisme. Ainsi, dans le n° 101 du 10 novembre 1932, Mme Cozzens présentait la guerre menée de 1899 à 1901 par Oba’a Mbeti, le chef insurgé des Yemeyema’a d’Ebemvok, contre les Allemands à Kribi comme un modèle de libération d’un peuple de l’oppression étrangère. Elle était contre les injustices coloniales.",
    "En 1932, Mme Cozzens quitta la direction de Mefoé pour prendre celle du Halsey Memorial Press (HMP), une imprimerie implantée à Elat en 1916 pour la vulgarisation de la littérature chrétienne. Avant la prise en charge du HMP par Mme Cozzens, cette maison n’éditait que des ouvrages scolaires, les journaux de la MPA, notamment Drum Call et Mefoé, et bien évidemment la littérature à caractère chrétien. Entre autres, les cantiques intitulés Bia ya kaὴe Zambe (Chansons pour adorer Dieu), la Bible, les Minfasan (méditation), sorte de guides d’enseignements annuels pour les cultes du matin, les Minutes, c’est-à-dire les rapports d’activités des différentes structures de la MPA et enfin les opuscules en français (esquisse) et en langue bulu (Binyiὴ) relatant la vie des premiers missionnaires presbytériens au Cameroun. Mais après 1932, Mme Cozzens mit un accent particulier sur la promotion d’une littérature culturelle à «toile de fond politique». C’est ainsi qu’elle réadapta l’œuvre de Mary Holding intitulé Ndé mewut ma kobo (Si les pierres de cuisine pouvaient parler). Ce livre était pour elle une occasion de faire une critique à peine voilée de la situation des Camerounais sous la colonisation française.",
    "Mme Cozzens mit un point d’honneur à faire émerger une classe d’auteurs locaux. C’est sur son insistance, et sous sa direction, que Jean Louis Ndjemba Medou, un des instituteurs Camerounais en service à l’école missionnaire d’Elat, rédigea un roman en langue bulu intitulé Nanga Kon (fantôme blanc). Ce roman connut par la suite un réel succès auprès de la population bulu et sur le plan international. C’est ainsi qu’en 1932, Nanga Kon, le tout premier roman écrit par un Camerounais, obtint le Prix Margaret Wrong de l’Institut International Africain de Londres.",
    "Mais, c’est sur le plan politique que Mme Cozzens étala son génie d’organisatrice d’exception. Dans la région du Sud Cameroun en général, et chez les Bulu en particulier, elle mena une action certes lente, mais non moins intelligente et efficace, pour faire naître une conscience nationaliste chez ces populations victimes des vicissitudes de l’indigénat. Bien sûr, l’anticolonialisme était l’une des caractéristiques des enseignements de la MPA. De même, de nombreuses femmes de cette mission, à instar de Miss Hunter Mary Elisabeth, une Américaine en service à la station de Djongolo, ne manquaient pas d’étaler leur mépris vis- à-vis de la France et du colonialisme. Mme Cozzens, de par son action, fut la figure la plus remarquable dans la participation directe des missionnaires presbytériens à l’éveil du nationalisme camerounais. Pendant près de vingt ans, elle mena une action souterraine pour faire émerger dans le Sud Cameroun un vaste mouvement anticolonial ayant les Bulu comme fer de lance.",
    "Dans un premier temps, elle commença par adopter deux jeunes de la subdivision d’Ebolowa, Samuel Mbiam Mgbwa du village Nkoétyé et Daniel Awong Ango de Man-mi-Yéminsem. Ils étaient respectivement Yévo et Yéminsem, les deux clans bulu les plus nombreux du point de vue numérique de la subdivision d’Ebolowa. Après ses études primaires à Elat, le premier devint instituteur des écoles MPA alors que le second, plus brillant, alla poursuivre ses études à l’Ecole Normale de Fulassi (ENF) et plus tard à l’Ecole de Théologie de Bibia (ETB). A la fin de sa formation, Awong Ango fut affecté à Mvangan à la fois comme Pasteur et enseignant. Mais, malgré la forte demande de l’époque, il n’exerça pas longtemps le métier d’enseignant.",
    "Mme Cozzens était consciente du fait que l’action dans laquelle elle s’était engagée lui attirerait des ennuis et qu’elle risquait de perdre sa vie. Mais elle n’avait pas peur car, en toute liberté, elle s’est portée volontaire pour ce rôle que son statut de missionnaire ne lui obligeait nullement à jouer. Cette réalité indiscutable est clairement attestée par les paroles de sa dernière traduction des cantiques, celle achevée le 12 octobre 1949 et trouvée sur son piano le matin de son assassinat. Il s’agit du cantique n° 168 du recueil Bia ya kaὴe Zambe intitulé Ô kate mba foé nyo (the conforter has come). Voici ce qu’on lit dans le dernier couplet :",
    "Me nji ke tu’a yem, zen m’aye wulu den,\nNge m’aye wô’ô mintaé, nge m’aye yene mvaé,\nV’akôsa bo awu, me nji ko woň,\nNya Mvolô Nlem a nto (Bia ya kaὴe Zambe, 1954).",
    "Une traduction approximative de ces paroles de la langue bulu à la langue française, donne à peu près ceci :",
    "Je ne connais pas très bien, le chemin que je vais emprunter ce jour,\nJe ne sais pas, si je vais souffrir, ou si je rencontrerai le bonheur,\nMais malgré la mort, je n’ai plus peur car, Le Saint-Esprit est avec moi.",
    "Mme Cozzens fut incontestablement l’une des figures ayant marqué l’histoire du presbytérianisme américain dans les anciennes régions administratives du N’tem et de Kribi en particulier et au Cameroun en général.",
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
              margin: EdgeInsets.only(bottom: 12),
              width: MediaQuery.of(context).size.width * 0.5,
              child: Text(
                "I" + "LS ONT MARQUÉ LA MISSION PRESBYTÉRIENNE AMERICAINE".toLowerCase(),
                style: TextStyle(fontSize: 12, height: 1.15, color: Colors.grey),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 24),
              width: 220,
              child: Text(
                "LUCIA HAMMOND ÉPSE COZZENS",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, height: 1.15),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 24),
              child: Image.asset(
                "assets/images/cozzens.png",
                height: 250,
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
                style: TextStyle(height: 1.15, color: Colors.grey),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              width: double.infinity,
              child: Text(
                textes[12],
                textAlign: TextAlign.justify,
                style: TextStyle(height: 1.15),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              width: double.infinity,
              child: Text(
                textes[13],
                style: TextStyle(height: 1.15, color: Colors.grey),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              width: double.infinity,
              child: Text(
                textes[14],
                textAlign: TextAlign.justify,
                style: TextStyle(height: 1.15),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              width: double.infinity,
              child: Text(
                textes[15],
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
