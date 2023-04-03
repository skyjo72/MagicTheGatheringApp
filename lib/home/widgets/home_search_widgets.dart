import 'package:english_words/english_words.dart';
import 'package:flappy_search_bar_ns/flappy_search_bar_ns.dart';
import 'package:flappy_search_bar_ns/search_bar_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:magic_dictionnary_app/common/models/word_model.dart';
import 'package:magic_dictionnary_app/word%20page/word_page_widget.dart';
import 'home_header_widgets.dart';

class HomeSearch extends StatefulWidget {
  const HomeSearch({Key? key}) : super(key: key);

  @override
  State<HomeSearch> createState() => _HomeSearchState();
}

class _HomeSearchState extends State<HomeSearch> {
  final SearchBarController<Words> _searchBarController = SearchBarController();

  Future<List<Words>> _getALlPosts(String? text) async {
    List<Words> words = [];
    List<String> englishWords = all;

    for (var word in englishWords) {
      if (word.contains(text as Pattern)) {
        words.add(Words(word, false));
      }
    }
    return words;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Expanded(flex: 1, child: HomeHeader()),
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(195, 84, 39, 1),
                      border: Border.all(
                        style: BorderStyle.solid,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: SearchBar<Words>(
                        minimumChars: 1,
                        searchBarPadding:
                            const EdgeInsets.symmetric(horizontal: 30),
                        searchBarStyle:
                            const SearchBarStyle(backgroundColor: Colors.white),
                        headerPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                        listPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        onSearch: _getALlPosts,
                        searchBarController: _searchBarController,
                        placeHolder: const Center(
                            child: Text(
                          "PlaceHolder",
                          style: TextStyle(fontSize: 30),
                        )),
                        cancellationWidget: const Text("Cancel"),
                        emptyWidget: const Center(child: Text("No result found")),
                        shrinkWrap: false,
                        mainAxisSpacing: 5,
                        crossAxisCount: 1,
                        onItemFound: (Words? word, int index) {
                          IconData icon;
                          if (word!.favorite) {
                            icon = Icons.favorite;
                          } else {
                            icon = Icons.favorite_border;
                          }
                          return Card(
                              color: Colors.white,
                              child: ListTile(
                                title: Text(word!.title),
                                onTap: (){
                                  HapticFeedback.mediumImpact();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => WordPage(word: word)),
                                  );
                                },
                                trailing: Icon(icon)
                              ));
                        }),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
