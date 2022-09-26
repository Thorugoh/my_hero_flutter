import 'package:flutter/material.dart';

class FavoriteIcon extends StatelessWidget {
  final VoidCallback onTapFavorite;
  final bool isFavorited;
  final IconData icon;
  final Color color;
  final double size;

  const FavoriteIcon(
      {super.key,
      required this.onTapFavorite,
      required this.isFavorited,
      required this.size})
      : icon = isFavorited ? Icons.favorite : Icons.favorite_outline,
        color = isFavorited ? Colors.redAccent : Colors.white;

  @override
  Widget build(BuildContext context) {
    // return(
    //   IconButton(icon: Icon(Icons.favorite_border, color: Colors.white, ), onPressed: (),)
    // )
    return (InkWell(
      onTap: onTapFavorite,
      child: Container(
        height: size * 1.25,
        width: size * 1.25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular((size * 1.25) / 2)),
          color: const Color.fromRGBO(255, 255, 255, 0.3),
        ),
        child: Icon(
          icon,
          color: color,
          size: size,
          textDirection: TextDirection.ltr,
        ),
      ),
    ));
  }
}
