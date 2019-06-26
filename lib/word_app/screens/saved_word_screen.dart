import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:freddy/word_app/models/WordModel.dart';
import 'package:provider/provider.dart';


class SavedWordScreenState extends State<StatefulWidget>{

  final TextStyle _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Suggestions'),
      ),
      body: Consumer<WordModel>(
        builder: (context, wordModel, child) =>
            ListView(children: getChildren(wordModel.saved)),
      )
    );
  }

  List<Widget> getChildren(Set<WordPair> _saved){
    final Iterable<ListTile> tiles = _saved.map( (WordPair pair) {
      return ListTile(
        title: Text(
          pair.asPascalCase,
          style: _biggerFont,
        ),
      );
    },
    );

    return ListTile.divideTiles(
      context: context,
      tiles: tiles,
    ).toList();
  }

}

class SavedWordScreen extends StatefulWidget{
  @override
  SavedWordScreenState createState() => SavedWordScreenState();
}