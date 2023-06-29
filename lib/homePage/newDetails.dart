import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:wordpress_iglesia/utilities/layoutUtility.dart';

class NewDetails extends StatelessWidget {
  const NewDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                  "https://www.ar-racking.com/gestor/recursos/uploads/imagenes/blog/Stock-seguridad/stock-de-seguridad-almacen.jpg",
                  fit: BoxFit.cover)),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          expandedHeight: 250,
        ),
        SliverFillRemaining(child: NewDetailsSection())
      ],
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
          LayoutUtils.iconText(Icon(Icons.timer), Text("01 de Enero 2021")),
          SizedBox(height: 15),
          Text(
            "Mensaje vistoso",
            style: TextStyle(
                fontSize: 16, color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            child: Divider(color: Colors.grey, thickness: 2),
            width: 100,
          ),
          Expanded(
              child: Html(style: {
            "p": Style(color: Colors.grey, fontSize: FontSize.large)
          }, data: "<p>texto nuevo</p>texto nuevp para"))
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
            child: Text("Sports",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold)),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Row(
            children: [
              IconButton(onPressed: null, icon: Icon(Icons.mail)),
              IconButton(onPressed: null, icon: Icon(Icons.mail))
            ],
          ),
        )
      ],
    );
  }
}
