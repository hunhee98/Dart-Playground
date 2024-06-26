import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:learn_dart_together/12_data_source/model/photo.dart';

final class PhotoDataSource {
  Future<List<Photo>> getPhotos(int albumId) async {
    final http.Response response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    List jsonList = jsonDecode(response.body);
    return jsonList.map((e) => Photo.fromJson(e)).toList();
  }
}