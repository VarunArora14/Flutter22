import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  word_pair stores a pair of 2 words chosen randomly
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Company Names",
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Company Names'),
        ),
        body: const Center(
          child: Randomwords(),
        ),
      ),
    );
  }
}

class Randomwords extends StatefulWidget {
  const Randomwords({Key? key}) : super(key: key);

  @override
  State<Randomwords> createState() => _RandomwordsState();
}

class _RandomwordsState extends State<Randomwords> {
  final _suggestions = <WordPair>[];
  @override
  Widget build(BuildContext context) {
    // define inside the build and not above
    // final wordPair = WordPair.random();
    // return Text(wordPair.first + " " + wordPair.second);
    return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, i) {
          if (i.isOdd) return const Divider();
          final idx = i ~/ 2;

          //  The syntax i ~/ 2 divides i by 2 and returns an integer result. For example, the list [1,2,3,4,5] becomes [0,1,1,2,2].
          //This calculates the actual number of word pairings in the ListView,minus the divider widgets.
          if (idx >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return ListTile(
            title: Text(_suggestions[idx].asPascalCase),
            style: ListTileStyle.list,
          );
        });
  }
}
