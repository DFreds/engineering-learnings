import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart';
import 'package:my_flutter_samples/network_request_list/photo.dart';

class MyRepo {
  static Client client = Client();

  static Future<Photo> fetchPhoto() async {
    final response = await client.get('https://jsonplaceholder.typicode.com/photos/1');

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON
      return Photo.fromJson(json.decode(response.body));
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load photo');
    }
  }

  static Future<List<Photo>> fetchPhotos() async {
    final response = await client.get('https://jsonplaceholder.typicode.com/photos');

    var list = json.decode(response.body) as List;

    if (response.statusCode == 200) {
      List<Photo> photos = list.map((item) {
        return Photo.fromJson(item);
      }).toList();

      return photos;
    } else {
      throw Exception('Failed to load photos');
    }
  }
}
