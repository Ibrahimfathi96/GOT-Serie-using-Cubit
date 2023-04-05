import 'dart:async';
import 'dart:convert';
import 'dart:io';

import '../Models/character.dart';

class Api {

  final String _baseUrl = 'rickandmortyapi.com';
  final String _charactersUrl = '/api/character';
  final String _charactersJsonKey = 'results';

  final HttpClient _httpClient = HttpClient();

  Future<List<Character>?> getCharacters() async {
    final uri = Uri.https(_baseUrl, _charactersUrl);
    final response = await _getJson(uri);

    if (response == null || response[_charactersJsonKey] == null) {
      print('Api.getCharacters(): Error while retrieving characters');
      return null;
    }

    return _convert(response[_charactersJsonKey]);
  }

  Future<Map<String, dynamic>?> _getJson(Uri uri) async {
    try {
      final request = await _httpClient.getUrl(uri);
      final response = await request.close();

      if (response.statusCode != HttpStatus.OK) {
        print('Api._getJson($uri) status code is ${response.statusCode}');
        return null;
      }

      final responseBody = await response.transform(utf8.decoder).join();
      return json.decode(responseBody);
    } on Exception catch (e) {
      print('Api._getJson($uri) exception thrown: $e');
      return null;
    }
  }

  List<Character> _convert(List charactersJson) {
    List<Character> characters = <Character>[];

    charactersJson.forEach((character) {
      characters.add(Character.fromJson(character));
    });

    return characters;
  }
}

// import 'package:dio/dio.dart';
//
// import '../../constants/strings.dart';
//
// class CharactersWebServices {
//   late Dio dio;
//   CharactersWebServices() {
//     BaseOptions options = BaseOptions(
//         baseUrl: baseUrl,
//         receiveDataWhenStatusError: true,
//         connectTimeout: Duration(seconds: 20), //60 seconds
//         receiveTimeout: Duration(seconds: 20) //60 seconds
//         );
//     dio = Dio(options);
//   }
//   Future<Map<String, dynamic>> getAllCharacters() async {
//     try {
//       Response response = await dio.get('character');
//       print(response.data.toString());
//       return response.data;
//     } catch (e) {
//       print(e.toString());
//       return {};
//     }
//   }
// }

/*
///http api call in case dio failed
var request = http.Request('GET', Uri.parse('https://rickandmortyapi.com/api/character'));


http.StreamedResponse response = await request.send();

if (response.statusCode == 200) {
  print(await response.stream.bytesToString());
}
else {
  print(response.reasonPhrase);
}

*/
