import "package:flutter/material.dart";
import 'package:my_hero/blocs/favorites.dart';
import 'package:my_hero/components/heroes.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<FavoritesBloc>(context);

    return (Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(4),
        child: HeroesGridView(heroes: bloc.get()),
      ),
    ));
  }
}
