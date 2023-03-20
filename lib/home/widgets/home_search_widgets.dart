import 'dart:math';
import 'package:english_words/english_words.dart';
import 'package:flappy_search_bar_ns/flappy_search_bar_ns.dart';
import 'package:flappy_search_bar_ns/search_bar_style.dart';
import 'package:flutter/material.dart';

import 'home_header_widgets.dart';

class Post {
  final String title;
  final String body;
  final bool favorite;

  Post(this.title, this.body, this.favorite);
}

class HomeSearch extends StatefulWidget {
  const HomeSearch({Key? key}) : super(key: key);

  @override
  State<HomeSearch> createState() => _HomeSearchState();
}

class _HomeSearchState extends State<HomeSearch> {
  final SearchBarController<Post> _searchBarController = SearchBarController();

  Future<List<Post>> _getALlPosts(String? text) async {
    List<Post> posts = [];
    List<String> englishWords = all;

    var random = Random();
    for (var word in englishWords) {
      if (word.contains(text as Pattern)) {
        posts.add(
            Post(word, "body random number : ${random.nextInt(100)}", false));
      }
    }
    return posts;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children:  [
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
                    child: SearchBar<Post>(
                        minimumChars: 1,
                        searchBarPadding:
                            const EdgeInsets.symmetric(horizontal: 30),
                        searchBarStyle:
                            const SearchBarStyle(backgroundColor: Colors.white),
                        headerPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                        listPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 30),
                        onSearch: _getALlPosts,
                        searchBarController: _searchBarController,
                        placeHolder: const Center(
                            child: Text(
                          "PlaceHolder",
                          style: TextStyle(fontSize: 30),
                        )),
                        cancellationWidget: const Text("Cancel"),
                        emptyWidget: const Text("Empty"),
                        onCancelled: () {
                          print("Cancel trigger");
                        },
                        shrinkWrap: false,
                        mainAxisSpacing: 10,
                        crossAxisCount: 1,
                        onItemFound: (Post? post, int Index) {
                          return Container(
                              color: Colors.lightBlue,
                              child: ListTile(
                                  title: Text(post!.title),
                                  isThreeLine: true,
                                  subtitle: Text(post.body)));
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
