import 'package:ashour/Models/category_models/category_id_model.dart';
import 'package:ashour/Models/category_models/category_models.dart';
import 'package:ashour/Shared/Network/dio_helper.dart';
import 'package:dio/dio.dart';

class CategoryWebServices {
  late Dio dio;

  CategoryWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: 'http://badawy.dscloud.me:8080/',
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000,
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCategories(int page) async {
    try {
      // Response response = await dio
      //     .get('category?pageNo=$page&pageSize=10&sortBy=id&isDeleted=false');
     Response response = await DioHelper.getData(url: 'category?pageNo=$page&pageSize=10&sortBy=id&isDeleted=false');
      print(response.data['content'].toString());
      return response.data['content'];
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<List<dynamic>> getProductByID(int page, int id) async {
    try {
      Response response = await dio
          .get('product/category/$id?pageNo=$page&pageSize=10&sortBy=id');
      print(response.statusCode.toString());
      print(response.data.toString());
     //  Response response =
     // await DioHelper.getData(url: 'product/category/$id?pageNo=$page&pageSize=10&sortBy=id');
      print(response.data['content'].toString());
      return response.data['content'];
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

}
