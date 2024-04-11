import 'package:flutter/material.dart';
import 'package:play_words/constants/asnwer_stages.dart';
import 'package:play_words/data/models/tile_model.dart';

class Controller extends ChangeNotifier {
  int currentTile = 0;
  int currentRow = 0;
  List<TileModel> tilesEntered = [];
  setKeyTapped({required String value}) {
    if (value == 'ENTER') {
      if (currentTile == 5 * (currentRow + 1)) {
        currentRow++;
      }
      print('check tile');
    } 
    else if(value == 'DELETE') {
      if(currentTile > 5 * (currentRow + 1) - 5) {
        currentTile--;
        tilesEntered.removeLast();
      }
    }
    
    else {
      if (currentTile < 5 * (currentRow + 1)) {
        tilesEntered.add(TileModel(letter: value, stage: AnswerStage.notanswered));
        currentTile++;
      }
    }

  notifyListeners();
  }
}
