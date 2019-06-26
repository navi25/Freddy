import 'package:flutter/material.dart';
import 'package:freddy/word_app/screens/random_word_screen.dart';
import 'package:provider/provider.dart';

import 'models/WordModel.dart';

class WordApp extends StatelessWidget{
  
  String _title = "Welcome to flutter";
  Widget _homeScreen = RandomWordScreen();
  ThemeData _defaultTheme = ThemeData.light();
  
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      builder: (context) => WordModel(),
      child: getApp(),
    );
  }

  MaterialApp getApp() {
    return MaterialApp(
      title: _title,
      theme: _defaultTheme,
      home: _homeScreen,
    );
  }

}