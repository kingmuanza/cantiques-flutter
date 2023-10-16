import 'package:flutter/material.dart';

class IconePartition extends StatefulWidget {
  const IconePartition({
    Key? key,
  }) : super(key: key);

  @override
  State<IconePartition> createState() => _IconePartitionState();
}

class _IconePartitionState extends State<IconePartition> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      width: 24 * 1.3,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: const Icon(
                Icons.menu,
                color: Colors.black54,
              ),
              decoration: const BoxDecoration(
                // color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              child: const Icon(
                Icons.music_note,
                color: Colors.black54,
              ),
              decoration: const BoxDecoration(
                //color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
