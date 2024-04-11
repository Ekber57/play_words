import 'package:flutter/material.dart';
import 'package:play_words/controller.dart';
import 'package:provider/provider.dart';

class Tile extends StatelessWidget {
  final int index;
  const Tile({
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<Controller>(
      builder: (_, notifier, __) {
        if (notifier.tilesEntered.length > 0) {
          String text = "";
          text = notifier.tilesEntered[index].letter;
          return Center(child: Text(text));
        }
        else {
          return SizedBox();
        }
      },
    );
  }
}
