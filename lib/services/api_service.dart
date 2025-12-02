import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/character.dart';

class RickMortyService {
  static const String baseUrl = 'https://rickandmortyapi.com/api';

  static Future<List<Character>> getCharacters() async {
    final response = await http.get(Uri.parse('$baseUrl/character'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<Character> characters = (data['results'] as List)
          .map((json) => Character.fromJson(json))
          .toList();
      return characters;
    }
    throw Exception('Error cargando personajes');
  }

  static Future<Character> getCharacter(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/character/$id'));

    if (response.statusCode == 200) {
      return Character.fromJson(json.decode(response.body));
    }
    throw Exception('Error cargando personaje $id');
  }
}
