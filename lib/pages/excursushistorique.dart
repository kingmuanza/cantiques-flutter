import 'package:cantiques/_components/sidemenu.component.dart';
import 'package:flutter/material.dart';

class ExcursusHistorique extends StatefulWidget {
  const ExcursusHistorique({super.key});

  @override
  State<ExcursusHistorique> createState() => _ExcursusHistoriqueState();
}

class _ExcursusHistoriqueState extends State<ExcursusHistorique> {
  List<String> textes = [
    "La devise de la Mission Presbytérienne Américaine (MPA), implantée au Cameroun à la fin du dix-neuvième siècle (1893), se déclinait comme un programme d’action ayant trois visées. Comme un triptyque de polarités indissociables : « self-governing », « self-supporting » and « self-propagating ». Donc, mettre en place une dynamique missionnaire ecclésiale qui pourrait à la longue avoir une autonomie administrative, s’autofinancer et concourir à son rayonnement. La traduction des chants liturgiques, de la Bible et des supports pédagogiques, dans les langues des populations autochtones aura été priorisée par les stratèges du programme des missions. Un levier pédagogique imparable. Surtout pour donner l’impression aux populations locales qu’elles étaient partie prenante dans ces mutations de paradigmes religieux. Nos ancêtres et devanciers n’avaient en fait pas le choix. Le sceptre colonial et la croix des Églises missionnaires avaient conclus des alliances tacites à cette époque. L’un soutenait l’autre. On échappait rarement au contrôle de l’autre quand on avait décidé de s’opposer à l’un. On comprend pourquoi les travaux de construction du grand temple, des écoles, des lieux de soins, de l’économat et de l’imprimerie furent entrepris concomitamment par les bâtisseurs de la MPA à Elat, l’un des premiers siège de la mission presbytérienne américaine au Cameroun. La « Halsey Memorial Press » qui était l’imprimerie de la MPA fut implantée sur la route d’Enongal. Elle jouxtait la première Ecole d’infirmières et infirmiers et l’hôpital de référence de cette époque. Cette imprimerie produisait en grand nombre diverses sortes de périodiques et manuels tout autant nécessaires pour les ministères ecclésiaux que les lieux d’éducation livresques. Les cantiques prenaient une part importante dans les carnets de commande de cette unité de production particulièrement rentable. Ces hymnes d’Église, qui faisaient corps avec les célébrations liturgiques, ont fortement impactés les premiers auditoires des missionnaires. Surtout leurs versions en langues locales.",
    "Il est établi que les chants occupaient une place importante dans les répertoires de la littérature orale africaine. Ils sont encore aujourd’hui considérés comme « la parure » du verbe des sociétés ancestrales de l’Afrique profonde1. Les véhicules de l’expression culturelle paléoafricaine étaient pour l’essentiel, la parole, les instruments de musique et les mélodies des griots. Diverses sonorités porteuses de sens symboliques intervenaient pour ponctuer et différencier les moments de la vie. Les danses et chants des cérémonies rituelles tranchaient avec les mélopées des funérailles. Les chants de ralliement qui inauguraient l’amorce des combats et guerres intertribales ressemblaient aux chants de bravoure des investitures patriarcales2. Diverses expertises produites sur la musicologie ancestrale africaine mettent en exergue la place primordiale que les chants occupaient dans les cultes nocturnes et diurnes. Mais aussi le rôle de médiateur entre le monde des ancêtres et le monde des vivants que les griots s’adjugeaient3. Soumis au prisme des analyses comparatives minutieuses pour mettre à jour la raison d’être de la survalorisation des hymnes des Églises missionnaires par les populations de l’Afrique précoloniale, il sera constaté que ces chants auront su se substituer aux sonorités rituelles ancestrales4. Surtout lorsque l’éducation livresque écrite sera de plus en plus préférée à l’oralité. Mais surtout lorsque les promesses de la religion des missionnaires, rappelées dans leurs chants, semblaient accomplies en faveur des vainqueurs de la conquête coloniale5.",
    "Les valeurs d’emprunt de la pédagogie des missions prendront de plus en plus de place dans la conscience collective des peuples auxquels était imposé cette assimilation culturelle. Ces espérances et compensations eschatologiques rendus visibles à travers les chants seront érigés en valeurs régaliennes. Les leçons que portaient les textes et contenus religieux de ces chants étaient vérifiables dans cette situation coloniale. Les indigènes voyaient la victoire, la domination, la prospérité, le savoir-faire et le bien-être en acte dans le camp du colonisateur. Ces gens étaient manifestement mieux lotis ! Certainement favorisés par un choix providentiel du sort. S’inscrire à cette école devenait tout naturellement une résolution de bon sens. L’on comprend pourquoi certaines valeurs véhiculées par la colonisation et plus particulièrement par les missionnaires vont traverser les âges. Une forme de cristallisation de leurs substrats dans les mémoires se fera à la manière d’un aboutissement irréversible. La chenille deviendra une chrysalide. Puis inéluctablement un papillon.",
    "Dans nos sociétés post-coloniales, aujourd’hui encore, lorsqu’on entend les airs et rythmes des chants de nos cantiques presbytériens ; même en dehors des célébrations d’Église, on sait d’emblée quels types de circonstances ils sont en train d’accompagner. Ces chants sont devenus des marqueurs identitaires d’un leg transmis de générations en générations.",
    "Comme la plupart des vestiges de la colonisation, la conservation de ces indicateurs de valeurs religieuses pose problème. Moults efforts ont été consentis pour que nos Églises ne soient pas sevrées de recueils de chants. La direction de l’éducation chrétienne de l’Église presbytérienne camerounaise a sollicité, sans fidéliser une structure particulière, un grand nombre d’imprimeurs pour produire les cantiques. Ce service circonstanciel souvent requis en fonction de la demande n’a pas permis d’arrimer les savoir- faire techniques avec un réel soucis de conservation de cet héritage à la hauteur de sa valeur. Puis le répertoire initial de ces hymnes a été enrichi par l’inspiration de nouveaux auteurs. Fallait-il faire un tri ou alors loger à la même enseigne le premier cru en bulu et le second ? Finalement on a adjoint à l’édition des textes, la transcription en partitions musicales.",
    "Ce recueil de cantiques en Bulu, Bassa, Bafia, Douala est le produit d’un travail harassant, fastidieux et ambitieux.",
    "Il ambitionne de rassembler en un jet des versions linguistiques des chants de célébrations liturgiques des missionnaires protestants. Puis être surtout une forme de refuge, une tour de garde imprenable pour nos cantiques dont l’usage à l’Église n’est qu’une infime valorisation de leur pesant d’or. Accorder le meilleur du savoir-faire des imprimeurs à un ensemble de textes qui ont en réalité leur place aux côtés d’autres pièces de musée c’est souhaité leur donner une autre forme de vie. Leur faire porter un autre sens. Nous avons la faiblesse de croire que ce recueil de chants est une affirmation en acte de ce ressenti exprimé par Etienne Lock dans sa thèse :",
    "« L’identité africaine englobe l’ensemble de tout ce qu’incarne l’Africain et qui exprime son histoire, son vécu et ses aspirations les plus profondes. Ce n’est pas une réalité figée, dans la mesure où, confrontée à d’autres formes d’humanité, elle a connu de nombreux changements et s’est enrichie de cette expérience. Et même, l’identité africaine reste en devenir, étant donné les mutations sociales qui affectent de manière permanente la mentalité africaine. Il faudra donc la saisir à travers permanences, constantes et mutations »6.",
    "Ce recueil de chant ayant pour initiateurs la fille d’un couple d’enseignants formés par la MPA dont le père est devenu Pasteur. Soutenue par le petit fils d'un catéchiste dont les parents ont été des facilitateurs du rayonnement de la MPA dans le Sud Cameroun est un chef-d’œuvre.",
    "Il était nécessaire d’imaginer un lieu original qui rende justice à la richesse de sens que nos cantiques protestants recèlent. Cet ouvrage de plusieurs centaines de pages est ce lieu. Un espace de rencontre qui met côte à côte le passé et le présent. Basile- Juléat Fouda montre la justesse de ce type d’alliance en ces termes :",
    "« En Afrique noire traditionnelle, au contraire, l’art littéraire ne saurait jamais se réduire au pur divertissement…Ici, le beau se confond avec l’utile, et l’utile avec le réussi. Le beau est adjuvant de l’utile, l’agréable est l’indice de l’efficace. »",
    "En guise de conclusion nous reprendrons l’une après l’autre pour notre compte ces affirmations bien connues de Cheikh Anta Diop :",
    "« La facilité avec laquelle nous renonçons, souvent, à notre culture ne s’explique que par notre ignorance de celle-ci, et non par une attitude progressiste adoptée en connaissance de cause. »",
    "« Il faut veiller à ce que l’Afrique ne fasse pas les frais du progrès humain. (..) froidement écrasée par la roue de l’histoire. (…) On ne saurait échapper aux nécessités du moment historique auquel on appartient”.",
    "Le Comité de Redaction",
    "1	Pour Charles Duvelle, (musicologue, fondateur de la collection Ocora. Expert international en matière d’ethnomusicologie) « la musique est envisagée dans les sociétés africaines traditionnelles comme partie intégrante du verbe. Parfois confondue avec le langage parlé, avec la danse, avec la cérémonie dans laquelle elle se situe. Il est fréquent de donner à telle musique le même nom que la cérémonie au cours de laquelle elle se joue. » [Voir Edition des archives de Charles Duvelle, collection Prophet,10 volumes, 1961-1974]. \n2	Charles Duvelle montre aussi que « l’étroite relation entre la musique, la danse, la parole et finalement la vie sociale elle-même dominée par la religion dans les sociétés traditionnelles africaines rend souvent difficile l’établissement d’une distinction très stricte entre musique profane et musique sacrée. Il existe cependant des genres qui appartiennent plus précisément au domaine sacré (musiques rituelles, musiques d’initiations) que d’autres (berceuses, complaintes), même si ceux-ci s’y rattachent aussi d’une certaine manière. » \n3	Voir, Dominique Zahan, Religion, spiritualité et pensée africaines, Paris, Payot, 1970. \n4	Voir aussi l’article de Sié Hien, Enseignant chercheur à l’UFR-ICA, Université Félix Houphouët-Boigny Cocody- Abidjan : Analyse de la musique traditionnelle, une contribution à l’éducation socioculturelle des cadres Lobi, in Revue Africaine d’Antropologie, Nyansa-Pô, n°15-2013. \n5	Voir, Etienne Lock, Identité africaine et catholicisme ; problématique de la rencontre de deux notions à travers l’itinéraire d’Alioune Diop, 1956-1995, thèse de doctorat. Université Charles De Gaulle-Lilles 3. Ecole doctorale sciences de l’homme et de la société. UFR sciences historiques, artistiques et politiques.\n6	Etienne Lock, Thèse de doctorat, op.cit., page 13.",
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
                "Excursus Historique",
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
                style: TextStyle(height: 1.15, color: Colors.grey),
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
                style: TextStyle(height: 1.15, color: Colors.grey),
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
            Container(
              margin: EdgeInsets.only(bottom: 16),
              width: double.infinity,
              child: Text(
                textes[12],
                textAlign: TextAlign.justify,
                style: TextStyle(height: 1.15, color: Colors.grey),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              width: double.infinity,
              child: Text(
                textes[13],
                textAlign: TextAlign.justify,
                style: TextStyle(height: 1.15, color: Colors.grey),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 48),
              width: double.infinity,
              child: Text(
                textes[14],
                textAlign: TextAlign.justify,
                style: TextStyle(height: 1.15, fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              width: double.infinity,
              child: Text(
                textes[15],
                textAlign: TextAlign.justify,
                style: TextStyle(height: 1.15, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
