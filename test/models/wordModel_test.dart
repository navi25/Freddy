import 'package:english_words/english_words.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freddy/word_app/models/WordModel.dart';

void main(){

  test("wordModel add function increases length of allWords", (){
      final  wordModel = WordModel();
      wordModel.addListener((){
        expect(1, wordModel.allWords.length);
      });
      wordModel.add(WordPair("hello", "world"));
  });

  test("wordModel toggleSave function toggles length of saved", (){
    final  wordModel = WordModel();
    bool toggled = false;
    wordModel.addListener((){
      if(toggled){
        expect(0, wordModel.saved.length);
      }else{
        expect(1, wordModel.saved.length);
      }

    });
    wordModel.toggleSave(WordPair("hello", "world"));
    toggled = true;
    wordModel.toggleSave(WordPair("hello", "world"));
  });
}