import 'package:ashour/Models/category_models/category_id_model.dart';
import 'package:ashour/Models/category_models/category_models.dart';
import 'package:ashour/services/web_service/category_web_service.dart';

class CategoryRepository {
  final CategoryWebServices categoryWebServices;

  CategoryRepository(this.categoryWebServices);

  Future<List<ContentModels>> getAllCategories(int page) async {
    final category = await categoryWebServices.getAllCategories(page);
    return category.map((e) => ContentModels.fromJson(e)).toList();
  }

  Future<List<CategoryContent>> getProductByID(int page, int id) async {
    final List<dynamic> category = await categoryWebServices.getProductByID(page, id);
    return category.map((e) => CategoryContent.fromJson(e)).toList();
  }

}
