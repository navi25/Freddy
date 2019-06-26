import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:freddy/word_app/models/WordModel.dart';
import 'package:freddy/word_app/screens/saved_word_screen.dart';
import 'package:provider/provider.dart';

class RandomWordScreenState extends State<RandomWordScreen>{

  final TextStyle _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text('Startup Name Generator'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => SavedWordScreen()));
  }

  Widget _buildSuggestions() {
    return Consumer<WordModel>(
      builder: (context,wordModel, child) => ListView.builder(
          padding: EdgeInsets.all(16),
          itemBuilder: (BuildContext _context, int i) {
            if(i.isOdd){
              return Divider();
            }

            final int index = i ~/ 2;

            if (index >= wordModel.allWords.length) {
              wordModel.allWords.addAll(generateWordPairs().take(10));
            }

            return _buildRow(wordModel.allWords[index]);
          }
      ),
    );

  }

  Widget _buildRow(WordPair pair) {
    return Consumer<WordModel>(
      builder: (context, wordModel, child) => ListTile(
        title: Text(
          pair.asPascalCase,
          style: _biggerFont,
        ),
        trailing: Icon(
          wordModel.alreadySaved(pair) ? Icons.favorite : Icons.favorite_border,
          color: wordModel.alreadySaved(pair) ? Colors.red : null,
        ),
        onTap: () {
         wordModel.toggleSave(pair);
        },
      ),

    );
  }

}

class RandomWordScreen extends StatefulWidget {
  @override
  RandomWordScreenState createState() => RandomWordScreenState();
}