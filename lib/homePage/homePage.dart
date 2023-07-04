import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:wordpress_iglesia/global/globals.dart' as globals;
import 'dart:convert';
import 'package:wordpress_iglesia/controllers/categories_controller.dart';
import 'package:wordpress_iglesia/global/data_services.dart';
import 'package:wordpress_iglesia/homePage/newDetails.dart';
import 'package:wordpress_iglesia/widget/newsCardWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static final String oneSignalAppId = "36231939-dca1-492d-860a-a71f75041f43";
  final CategoriesController categoriesController =
      Get.put(CategoriesController());
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 205, 203, 203),
      child: Obx(() {
        if (categoriesController.isLoading.value)
          return Center(
            child: CircularProgressIndicator(),
          );
        else
          return DefaultTabController(
              length: categoriesController.categoriesList.length,
              child: Scaffold(
                  appBar: AppBar(
                    title: Text("Manatial de Vida II"),
                    elevation: 0,
                    actions: <Widget>[
                      Icon(Icons.search, color: Colors.white),
                      SizedBox(width: 10),
                      Icon(
                        Icons.notifications,
                        color: Colors.white,
                      )
                    ],
                  ),
                  body: FutureBuilder(
                      future: lugares(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          var posts = snapshot.data;
                          return ListView.builder(
                            itemCount: posts.length,
                            itemBuilder: (context, index) {
                              return FutureBuilder<NewsCardWidget>(
                                future: obtenerCategoria(posts[index]),
                                builder: (BuildContext context,
                                    AsyncSnapshot<NewsCardWidget?> snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return CircularProgressIndicator();
                                  } else if (snapshot.hasError) {
                                    return Text('Error: ${snapshot.error}');
                                  } else {
                                    if (snapshot.data != null) {
                                      return snapshot.data!;
                                    } else {
                                      return Container(); // O cualquier otro widget que desees mostrar cuando el valor sea nulo
                                    }
                                  }
                                },
                              );
                            },
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      })));
      }),
    );
  }
Future<void> initPlatformState() async {
  OneSignal.shared.setNotificationWillShowInForegroundHandler((OSNotificationReceivedEvent event) {
    // Lógica para manejar la notificación recibida
  });
  
  await OneSignal.shared.setAppId(oneSignalAppId);
  await OneSignal.shared.promptUserForPushNotificationPermission();
  OneSignal.shared.setNotificationOpenedHandler((openendResult) {
    
    // Lógica para manejar la notificación abierta
    var data = openendResult.notification.additionalData;
  globals.appNavigator.currentState?.push(MaterialPageRoute(builder: (context) => NewDetails(postId: data!["post_id"].toString(),)));
  });
}
  Future<NewsCardWidget> obtenerCategoria(Map post) async {
    List<dynamic> categories = post['categories'];
    String categoryName = '';
    String cleanedContent = post['content']['rendered'].replaceAll(RegExp(r'<p>|<\/p>'), '');


var postDate = DateTime.parse(post['date']);
    if (categories.isNotEmpty) {
      String categoryUrl = post['_links']['wp:term'][0]['href'];

      try {
        final response = await http.get(Uri.parse(categoryUrl));

        if (response.statusCode == 200) {
          List<dynamic> categoryList = json.decode(response.body);
          categoryName = categoryList[0]['name'];
        } else {
          print('Error al obtener la categoría: ${response.statusCode}');
        }
      } catch (error) {
        print('Error al obtener la categoría: $error');
      }
    }

    return NewsCardWidget(
      title: post['title']['rendered'],
      description: post['excerpt']['rendered'],
      category: categoryName,
      date: postDate,
      content: cleanedContent,
    );
  }

  Widget tab(String tabName) {
    return Tab(
      text: tabName,
    );
  }
}
