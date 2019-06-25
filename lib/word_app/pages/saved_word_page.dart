import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';


class SavedWordScreenState extends State<StatefulWidget>{

  List<WordPair> _saved = <WordPair>[];
  final TextStyle _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {

    final Iterable<ListTile> tiles = _saved.map( (WordPair pair) {
        return ListTile(
          title: Text(
            pair.asPascalCase,
            style: _biggerFont,
          ),
        );
      },
    );

    final List<Widget> divided = ListTile.divideTiles(
      context: context,
      tiles: tiles,
    ).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Suggestions'),
      ),
      body: ListView(children: divided),
    );
  }

}

class SavedWordScreen extends StatefulWidget{
  @override
  SavedWordScreenState createState() => SavedWordScreenState();

}