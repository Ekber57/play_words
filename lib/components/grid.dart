import 'package:flutter/material.dart';
import 'package:play_words/controller.dart';
import 'package:provider/provider.dart';
class Grid extends StatelessWidget {
  const Grid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.fromLTRB(36, 20, 36, 20),
      itemCount: 30,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      crossAxisCount: 5), itemBuilder: (context,index){
      return Container(
        decoration: BoxDecoration(border: Border.all()),
      child: Tile(index: index,),
      );
    });
  }
}

class Tile extends StatelessWidget {
  int index;
   Tile({
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<Controller>(builder: (context, notifier, child) {
      if(notifier.tilesEntered.length > index ) {
      String text = notifier.tilesEntered[index].letter;
       return Center(child: Text(text));
      }
      else  {
        return SizedBox();
      }
    },);
  }
}