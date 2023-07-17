import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';
import 'package:wordpress_iglesia/utilities/layoutUtility.dart';

class NewDetails extends StatelessWidget {
  final String postId;
  final title;
  final description;
  final category;
  final date;
  final content;

  const NewDetails({super.key, required this.postId, required this.title, required this.description, required this.category, required this.date, required this.content});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
        body: SafeArea(
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
              slivers: [
          // SliverAppBar(
          //   flexibleSpace: FlexibleSpaceBar(
          //       background: Image.network(
          //           "https://www.ar-racking.com/gestor/recursos/uploads/imagenes/blog/Stock-seguridad/stock-de-seguridad-almacen.jpg",
          //           fit: BoxFit.cover)),
          //   backgroundColor: Colors.transparent,
          //   elevation: 0.0,
          //   expandedHeight: 250,
          // ),
          SliverFillRemaining(child: NewDetailsSection())
              ],
            ),
        ));
  }

  Widget NewDetailsSection() {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          row1(),
          SizedBox(height: 20,),
           Text(title, style: TextStyle(fontSize: 20),),
          SizedBox(height: 15),
          LayoutUtils.iconText(Icon(Icons.timer, color: Colors.grey),
          Text(
            //this.widget.postId,
             DateFormat('dd/MM/yyyy').format(date),
            style: TextStyle(
                fontSize: 16, color: Colors.grey, fontWeight: FontWeight.bold),
          )),
          SizedBox(
            child: Divider(color: Colors.grey, thickness: 2),
            width: 150,
          ),
         SizedBox(height: 15),
          Text(
            content,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget row1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(10)),
            child: Text(category,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold)),
          ),
        ),
      ],
    );
  }
}
