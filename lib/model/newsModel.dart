
import 'dart:convert';

List<NewsModel> postsFromJson(String str) =>
    List<NewsModel>.from(json.decode(str).map((x) => NewsModel.fromJson(x)));

//String newsModelToJson(List<NewsModel> data) =>
//   json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
NewsModel postDetailsFromJson(String str) =>
    NewsModel.fromJson(json.decode(str));

class NewsModel {
  NewsModel({
    required this.id,
    required this.postDate,
    required this.title,
    required this.categoryName,
    required this.categoryId,
    required this.postContent,
    required this.imageUrl,
  });

  int id;
  DateTime postDate;
  String title;
  dynamic categoryName;
  int categoryId;
  String postContent;
  dynamic imageUrl;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        id: json["id"],
        postDate: DateTime.parse(json["post_date"]),
        title: json["title"],
        categoryName: json["category_name"],
        categoryId: json["category_id"],
        postContent: json["post_content"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "post_date": postDate.toIso8601String(),
        "title": title,
        "category_name": categoryName,
        "category_id": categoryId,
        "post_content": postContent,
        "image_url": imageUrl,
      };
}
