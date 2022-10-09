import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart' as crypto;

const baseUrl = "gateway.marvel.com";
const PUBLIC_KEY = "b2310bfa325e0e8211124e61febbf1d3";
const PRIVATE_KEY = "41cba49c22416e6709bdf36182ebbe9b4ffa3105";

class Api {
  static String generateMd5(data) {
    var content = new Utf8Encoder().convert(data);
    var digest = crypto.md5.convert(content);
    return hex.encode(digest.bytes);
  }

  static Future<List<Character>> fetchCharacters(nameStartsWith) async {
    final params = {
      "apikey": PUBLIC_KEY,
      "ts": "1",
      "hash": generateMd5("1" + PRIVATE_KEY + PUBLIC_KEY),
      "limit": "20",
      "nameStartsWith": nameStartsWith,
    };

    var url = Uri.https(baseUrl, "/v1/public/characters", params);
    final response = await http.get(url);
    print(response.statusCode);
    print("name -> " + nameStartsWith);
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      Iterable list = responseData["data"]["results"];

      return list.map((model) => Character.fromJson(model)).toList();
    }
    return List<Character>.empty();
  }
}

class Character {
  final int id;
  final String name;
  final String description;
  final String thumbnail;

  const Character({
    required this.id,
    required this.name,
    required this.description,
    required this.thumbnail,
  });

  factory Character.fromJson(Map json) {
    return (Character(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      thumbnail:
          "${json['thumbnail']["path"]}.${json['thumbnail']["extension"]}",
    ));
  }

  static Map<String, dynamic> toMap(Character character) => {
        'id': character.id,
        'name': character.name,
        'description': character.description,
        'thumbnail': character.thumbnail,
      };
}
