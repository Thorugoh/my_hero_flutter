import 'package:flutter/material.dart';
import 'package:my_hero/blocs/favorites.dart';
import 'package:my_hero/components/heroes.dart';
import 'package:my_hero/components/searchbar.dart';
import 'package:my_hero/pages/tab_pages.dart';
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
      child: const MaterialApp(title: "My Hero", home: TabBarPages()),
    ));
  }
}
