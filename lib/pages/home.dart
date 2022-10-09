import "package:flutter/material.dart";
import 'package:my_hero/components/heroes.dart';
import 'package:my_hero/components/searchbar.dart';
import 'package:my_hero/services/api.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String search = "";
  List<Character> heroes = List<Character>.empty();

  void onChangeSearch(String text) {
    Api.fetchCharacters(text).then((response) {
      setState(() {
        heroes = response;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: SearchBar(
        onChangeSearch: onChangeSearch,
      ),
      body: Padding(
        padding: const EdgeInsets.all(4),
        child: HeroesGridView(heroes: heroes),
      ),
    ));
  }
}
