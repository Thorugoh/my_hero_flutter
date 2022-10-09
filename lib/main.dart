import 'package:flutter/material.dart';
import 'package:my_hero/blocs/favorites.dart';
import 'package:my_hero/components/heroes.dart';
import 'package:my_hero/services/api.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Center(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return (MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => FavoritesBloc())],
      child: const MaterialApp(
        title: "My Hero",
        home: MainPage(),
      ),
    ));
  }
}

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

class SearchBar extends StatelessWidget implements PreferredSizeWidget {
  final void Function(String) onChangeSearch;

  const SearchBar({super.key, required this.onChangeSearch});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      toolbarHeight: 60.0,
      title: TextField(
        onChanged: onChangeSearch,
        cursorColor: Colors.white,
        decoration: InputDecoration(
            hintText: " Search...",
            hintStyle: const TextStyle(color: Colors.white, fontSize: 15.0),
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: const Icon(Icons.search),
              color: Colors.white,
              onPressed: () {},
            )),
        style: const TextStyle(color: Colors.white, fontSize: 15.0),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
