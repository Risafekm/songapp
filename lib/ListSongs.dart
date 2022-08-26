import 'package:marquee/marquee.dart';
import 'package:flutter/material.dart';


class SongList extends StatelessWidget {
  const SongList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Marquee(text: 'List of songs ',
          style: TextStyle(fontSize: 20),
          velocity: 50.0,
        ),
      ),
    );
  }
}
