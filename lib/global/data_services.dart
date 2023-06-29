import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:wordpress_iglesia/model/newsModel.dart';

final dominiourl = 'http://zcanoticias.com/pedrito/wp-json/wp/v2/posts?_embed';
final urlID = 'http://zcanoticias.com/pedrito/wp-json/wp/v2/posts/';
Future<List> lugares() async{
  final response = await http.get(
  Uri.parse(dominiourl),
  headers: {'Accept': 'application/json'},
);

   var convertirJson = jsonDecode(response.body);
   
   return convertirJson;
}
Future<List<NewsModel>> post(int id) async{
  final response = await http.get(
  Uri.parse(urlID+id.toString()),
  headers: {'Accept': 'application/json'},
);

   var convertirJson = jsonDecode(response.body);
   print(convertirJson);
   return convertirJson;
}