import 'package:flutter/material.dart';
import 'package:magic_dictionnary_app/word%20page/word_header_widgets.dart';
import '../common/models/word_model.dart';

class WordPage extends StatefulWidget {
  const WordPage({Key? key, required this.word}) : super(key: key);

  final Words word;

  @override
  State<WordPage> createState() => _WordPageState();
}

class _WordPageState extends State<WordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Expanded(flex: 1, child: WordHeader(word: widget.word)),
        Expanded(
          flex: 7,
          child: Placeholder(),
        ),
      ],
    )));
  }
}
