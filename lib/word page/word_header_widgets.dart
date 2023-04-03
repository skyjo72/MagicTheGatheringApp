import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:magic_dictionnary_app/settings/settings_widgets.dart';

import '../common/models/word_model.dart';

class WordHeader extends StatelessWidget {
  const WordHeader({Key? key, required this.word}) : super(key: key);
  final Words word;

  @override
  Widget build(BuildContext context) {
    IconData icon;
    if (word.favorite) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Row(
      children: [
        Expanded(
            flex: 3,
            child: Column(
              children: [
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Text(word.title,
                                style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w400,
                                )),
                          )),
                    ))
              ],
            )),
        Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {
                HapticFeedback.mediumImpact();
                word.toggleFavorite();
              },
              child:Icon(icon ,size: 40, color: Colors.white),
            ))
      ],
    );
  }
}
