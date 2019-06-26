import 'dart:collection';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class WordModel extends ChangeNotifier{

  Set<WordPair> saved = Set<WordPair>();
  List<WordPair> allWords = <WordPair>[];
//
//  ListView<WordPair> get saved => ListView(_saved);
//  ListView<WordPair> get allWords => ListView(_allWords);

  void add(WordPair p){
    allWords.add(p);
    notifyListeners();
  }

  void toggleSave(WordPair p){
    if(saved.contains(p)){
      saved.remove(p);
    }else{
      saved.add(p);
    }
    notifyListeners();
  }

  bool alreadySaved(WordPair p) => saved.contains(p);

}