import 'package:flutter/material.dart';
import 'package:wordpress_iglesia/homePage/newDetails.dart';
import 'package:wordpress_iglesia/model/newsModel.dart';
import 'package:wordpress_iglesia/utilities/layoutUtility.dart';
import 'package:intl/intl.dart';
import 'package:flutter_html/flutter_html.dart';

class NewsCardWidget extends StatelessWidget {
  final title;
  final description;
  final category;
  final date;
  final content;

  String truncateDescription(String description, int maxLength) {
    if (description.length <= maxLength) {
      return description;
    } else {
      return description.substring(0, maxLength) + '...';
    }
  }

  const NewsCardWidget({
    Key? key,
    this.title,
    this.description,
    this.category,
    this.date,
    this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0), // Establecer el margen deseado
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NewDetails(postId: 'post_id',)),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: [
                  /*ClipRRect(
                    child: Image.network(
                      "https://images.ctfassets.net/hrltx12pl8hq/3AnnkVqrlhrqb9hjlMBzKX/693a8e5d40b4b6c55a7673ca4c807eef/Girl-Stock?fit=fill&w=600&h=338",
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                  ),*/
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        category ?? "Sin categoria",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        LayoutUtils.iconText(
                          Icon(Icons.date_range),
                          Text(
                            DateFormat('dd/MM/yyyy').format(date),
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      title ?? "Sin Nombre",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    SizedBox(height: 10.0),
                    Html(
                      data: truncateDescription(description, 100), // Limitar a 100 caracteres
                      style: {
                        'p': Style(
                          fontSize: FontSize(16.0),
                          lineHeight: LineHeight(1.5),
                          
                        ),
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
