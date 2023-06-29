import 'package:http/http.dart' as http;
import 'dart:convert';

final dominiourl = 'http://zcanoticias.com/pedrito/wp-json/wp/v2/posts?_embed';

Future<List> posts() async {
  final response = await http
      .get(Uri.parse(dominiourl), headers: {'Accept': 'application/json'});
  var convertirjson = jsonDecode(response.body);
  return convertirjson;
}
