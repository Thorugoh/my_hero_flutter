import "package:flutter/material.dart";
import 'package:my_hero/components/favorite_icon.dart';
import 'package:my_hero/hero_page.dart';

class HeroCard extends StatefulWidget {
  const HeroCard({super.key});

  @override
  State<HeroCard> createState() => _HeroCardState();
}

class _HeroCardState extends State<HeroCard> {
  var isFavorited = false;
  var containerBackgroundColor = Colors.black;

  void favoriteChar() {
    isFavorited = !isFavorited;
    if (isFavorited) {
      setState(() {
        containerBackgroundColor = Colors.redAccent;
      });
    } else {
      setState(() {
        containerBackgroundColor = Colors.black;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HeroPage()));
      },
      child: Column(
        children: [
          Container(
            color: Colors.white,
            width: double.infinity,
            child: const Image(
              image: NetworkImage(
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
              fit: BoxFit.cover,
              height: 160,
            ),
          ),
          Container(
            color: Colors.redAccent,
            height: 5,
          ),
          Container(
            color: containerBackgroundColor,
            height: 136,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 4, left: 4),
                  child: const Text(
                    "Owl",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
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
                      onTapFavorite: favoriteChar,
                      isFavorited: isFavorited,
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
