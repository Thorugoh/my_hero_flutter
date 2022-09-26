import 'package:flutter/material.dart';
import 'package:my_hero/components/favorite_icon.dart';
import 'package:my_hero/components/hero_card.dart';
import 'package:my_hero/hero_page.dart';

void main() {
  runApp(const Center(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return (const MaterialApp(
      title: "My Hero",
      home: MainPage(),
    ));
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  static const String _title = "My Hero Title";

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: const SearchBar(),
      body: Padding(
        padding: const EdgeInsets.all(4),
        child: ListView(
          children: [
            Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Expanded(child: HeroCard()),
                  SizedBox(
                    width: 2,
                  ),
                  Expanded(child: HeroCard())
                ],
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Expanded(child: HeroCard()),
                  SizedBox(
                    width: 2,
                  ),
                  Expanded(child: HeroCard())
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}

class SearchBar extends StatelessWidget implements PreferredSizeWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      toolbarHeight: 60.0,
      title: TextField(
        cursorColor: Colors.white,
        decoration: InputDecoration(
            hintText: " Search...",
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: Icon(Icons.search),
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
