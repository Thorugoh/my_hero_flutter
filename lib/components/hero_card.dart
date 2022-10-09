import "package:flutter/material.dart";
import 'package:my_hero/blocs/favorites.dart';
import 'package:my_hero/components/favorite_icon.dart';
import 'package:my_hero/hero_page.dart';
import 'package:my_hero/services/api.dart';
import 'package:provider/provider.dart';

class HeroCard extends StatefulWidget {
  final Character character;

  const HeroCard({super.key, required this.character});

  @override
  State<HeroCard> createState() => _HeroCardState();
}

class _HeroCardState extends State<HeroCard> {
  var containerBackgroundColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<FavoritesBloc>(context);

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HeroPage(character: widget.character),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            color: Colors.white,
            width: double.infinity,
            child: Image(
              image: NetworkImage(widget.character.thumbnail),
              fit: BoxFit.cover,
              height: 160,
            ),
          ),
          Container(
            color: Colors.redAccent,
            height: 5,
          ),
          Container(
            color: bloc.isFavorite(widget.character)
                ? Colors.redAccent
                : Colors.black,
            height: 136,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 4, left: 4),
                  child: Text(
                    widget.character.name,
                    textDirection: TextDirection.ltr,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: FavoriteIcon(
                      size: 25,
                      onTapFavorite: () =>
                          bloc.toggleFavorite(widget.character),
                      isFavorited: bloc.isFavorite(widget.character),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
