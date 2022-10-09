import "package:flutter/material.dart";
import 'package:my_hero/pages/favorites.dart';
import 'package:my_hero/pages/home.dart';

class TabBarPages extends StatefulWidget {
  const TabBarPages({super.key});

  @override
  State<TabBarPages> createState() => _TabBarPagesState();
}

class _TabBarPagesState extends State<TabBarPages> {
  int _selectedItem = 1;
  static const List<Widget> _pages = <Widget>[
    MainPage(),
    FavoritesPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedItem = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Center(
          child: _pages.elementAt(_selectedItem),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedItem,
          onTap: _onItemTapped,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favorites",
            ),
          ],
        ),
      ),
    );
  }
}
