import 'package:flutter/material.dart';
import 'package:play_words/components/grid.dart';
import 'package:play_words/components/keyboard_row.dart';
import 'package:play_words/data/keys_map.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Play Words"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
              child: Container(
            color: Color(0xFFFFEB3B),
            child: const Grid(),
          )),
          Expanded(
            flex: 1,
              child: Container(
            color: Colors.green,
            child: Column(children: [
              const KeyboardRow(min : 1 ,max :8),
              const KeyboardRow(min : 9 ,max :15),
              const KeyboardRow(min : 16 ,max :22),
              const KeyboardRow(min : 23 ,max :30),
              const KeyboardRow(min : 30 ,max :34),
         
            ],),
          ))
        ],
      ),
    );
  }
}
