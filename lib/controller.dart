import 'package:flutter/material.dart';
import 'package:play_words/constants/asnwer_stages.dart';
import 'package:play_words/data/models/tile_model.dart';

class Controller extends ChangeNotifier {
   String correctWord = '';
   setCorrectWord({required String word})=>correctWord = word;
  int currentTile = 0;
  int currentRow = 0;
  List<TileModel> tilesEntered = [];
  setKeyTapped({required String value}) {
    if (value == 'ENTER') {
      if (currentTile == 5 * (currentRow + 1)) {
        checkWord();
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

  checkWord() {
    List<String> guessed = [],remainingCorrect  = [];
    String guessedWord = "";
    for(int i = currentRow * 5; i < (currentRow *5) + 5;i++) {
      guessed.add(tilesEntered[i].letter);
    }
    guessedWord = guessed.join();
    remainingCorrect = correctWord.characters.toList();
    if(guessedWord == correctWord) {
    
      print("Okay");
    }
    else {
      for(int i = 0; i < 5; i++ ) {
        if(guessedWord[i] == correctWord[i]) {
        remainingCorrect.remove(guessedWord[i]);
        }
      }
      for(int i = 0; i < remainingCorrect.length; i++){
           for(int l = 0; l < 5; l++ ) {
            if(remainingCorrect[i] ==  tilesEntered[l + currentRow * 5].letter) {
              print('constants ${remainingCorrect[i]}');
            }
           }
      }
    }
  }
}
