import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:wordpress_iglesia/global/config.dart';
import 'package:wordpress_iglesia/model/category_model.dart';
import 'package:wordpress_iglesia/model/newsModel.dart';


class APIService {
  static var client = http.Client();
  static Future<List<CategoryModel>> fetchCategories() async {
    var response = await client.get(Uri.parse(Config.apiURL + Config.category));

    if (response.statusCode == 200){ 
      var jsonString = response.body;
      return categoryModelFromJson(jsonString);
    } else {
      
      throw Exception('error en datos ${response.statusCode}');
    }
  }

/*static Future<List<NewsModel>> fetchPosts(int categoryId) async {
  var response = await client.get(Uri.parse(Config.apiURL + Config.postsURL));
  if (response.statusCode == 200) {
    var jsonString = response.body;
    print(jsonString);
    return postsFromJson(jsonString);
  } else {
    throw Exception('Error al obtener los posts');
  }
}*/

}
