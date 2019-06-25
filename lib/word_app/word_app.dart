import 'package:flutter/material.dart';
import 'package:freddy/word_app/pages/random_word_page.dart';


class WordApp extends StatelessWidget{
  
  String _title = "Welcome to flutter";
  Widget _homeScreen = RandomWordScreen();
  ThemeData _defaultTheme = ThemeData.light();
  
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: _title,
      theme: _defaultTheme,
      home: _homeScreen ,
    );
  }

}