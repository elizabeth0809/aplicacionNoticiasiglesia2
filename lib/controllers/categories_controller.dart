import 'package:get/get.dart';
import 'package:wordpress_iglesia/global/api_services.dart';
import 'package:wordpress_iglesia/model/category_model.dart';


class CategoriesController extends GetxController {
  final isLoading = true.obs;
  final categoriesList = <CategoryModel>[].obs;
  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async {
    try {
      isLoading(true);
      var categories = await APIService.fetchCategories();
      if (categories.length > 0) {
        categoriesList.clear();
        categoriesList.addAll(categories);
      }
      
    } finally {
      isLoading(false);
    }
  }
}
