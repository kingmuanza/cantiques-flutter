import 'package:cantiques/pages/home.page.dart';
import 'package:flutter/material.dart';

import '../_models/cantique.langue.model.dart';

class CantiquesRecents extends StatelessWidget {
  final List<CantiqueLangue> cantiques;
  const CantiquesRecents({
    Key? key,
    required this.cantiques,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: 196,
          // color: Colors.green,
          child: Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  // color: Colors.yellow,
                  height: 180,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push<void>(
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => HomePage(),
                        ),
                      );
                    },
                    child: Center(
                      child: Container(
                        height: 180,
                        width: 130,
                        margin: EdgeInsets.only(right: 12),
                        decoration: BoxDecoration(
                          color: Colors.brown.shade900
                              .withOpacity(1 - index * 0.01),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            Container(
                              // color: Colors.red,
                              height: 100,
                              width: double.infinity,
                              child: Center(
                                child: Text(
                                  "${4 - index}",
                                  style: TextStyle(
                                    color: Colors.yellow,
                                    fontSize: 70,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 30,
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Center(
                                child: Text(
                                  "Langues + partions",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 30,
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Center(
                                child: Text(
                                  "150",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
