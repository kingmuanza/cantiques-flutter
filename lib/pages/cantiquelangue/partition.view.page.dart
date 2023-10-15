import 'package:flutter/material.dart';

class PartitionViewPage extends StatefulWidget {
  final int numeroPartition;
  final String titre;
  const PartitionViewPage({super.key, required this.numeroPartition, required this.titre});

  @override
  State<PartitionViewPage> createState() => _PartitionViewPageState();
}

class _PartitionViewPageState extends State<PartitionViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titre),
        backgroundColor: Colors.brown.shade900,
      ),
      body: Image.asset(
        "assets/images/partitions/Staff Hymns1024_${widget.numeroPartition}.jpg",
        width: double.infinity,
      ),
    );
  }
}
