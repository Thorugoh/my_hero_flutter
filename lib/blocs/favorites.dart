import 'package:flutter/cupertino.dart';
import 'package:my_hero/services/api.dart';

class FavoritesBloc extends ChangeNotifier {
  var favorites = List<Character>.empty(growable: true);
  get() {
    return favorites;
  }

  addFavorite(Character character) {
    favorites.add(character);
    notifyListeners();
  }

  removeFavorite(Character character) {
    favorites.removeWhere((char) => char.id == character.id);
    notifyListeners();
  }

  isFavorite(Character character) {
    return favorites.any((favorite) => favorite.id == character.id);
  }

  toggleFavorite(Character character) {
    if (isFavorite(character)) {
      removeFavorite(character);
    } else {
      addFavorite(character);
    }
  }
}
