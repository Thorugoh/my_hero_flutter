import "package:flutter/material.dart";
import 'package:my_hero/blocs/favorites.dart';
import 'package:my_hero/components/favorite_icon.dart';
import 'package:my_hero/services/api.dart';
import 'package:provider/provider.dart';

class HeroPage extends StatefulWidget {
  final Character character;
  const HeroPage({super.key, required this.character});

  @override
  State<HeroPage> createState() => _HeroPageState();
}

class _HeroPageState extends State<HeroPage> {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<FavoritesBloc>(context);
    final isFavorite = bloc.isFavorite(widget.character);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Detalhes do Personagem"),
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image(
            image: NetworkImage(widget.character.thumbnail),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: isFavorite ? Colors.redAccent : Colors.black,
              width: double.infinity,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        widget.character.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: FavoriteIcon(
                          size: 35,
                          onTapFavorite: () =>
                              bloc.toggleFavorite(widget.character),
                          isFavorited: isFavorite,
                        ),
                      ),
                    )
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
