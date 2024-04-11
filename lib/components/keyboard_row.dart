import 'package:flutter/material.dart';
import 'package:play_words/controller.dart';
import 'package:play_words/data/keys_map.dart';
import 'package:provider/provider.dart';

class KeyboardRow extends StatelessWidget {
  const KeyboardRow({
    required this.min,
    required this.max,
    super.key,
  });

  final int min, max;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    int index = 0;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: keysMap.entries.map((e) {
        index++;
        if (index >= min && index <= max) {
          return Padding(
            padding: EdgeInsets.all(size.width * 0.002),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Container(
                  color: Colors.white70,
                  width: (index == 34)? size.width * 0.30 : (index == 33)?size.width * 0.21: size.width * 0.12,
                  height: size.height * 0.05,
                  child: Material(child: InkWell(
                    onTap: () {
                      Provider.of<Controller>(context,listen: false).setKeyTapped(value: e.key);

                    },
                    child: Center(child: Text(e.key))))),
            ),
          );
        } else {
          return SizedBox();
        }
      }).toList(),
    );
  }
}
