import 'package:ashour/Layout/cubit/category_states.dart';
import 'package:ashour/Models/category_models/category_id_model.dart';
import 'package:ashour/Models/category_models/category_models.dart';
import 'package:ashour/Modules/cart/cart_screen.dart';
import 'package:ashour/Modules/category/Category/category_screen.dart';
import 'package:ashour/Modules/home/home_screen.dart';
import 'package:ashour/Modules/profile/profile_screen.dart';
import 'package:ashour/Shared/Network/dio_helper.dart';
import 'package:ashour/services/repositories/category_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AshourCubit extends Cubit<AshourStates> {
  final CategoryRepository categoryRepository;

  AshourCubit(this.categoryRepository) : super(InitialCategoryState());

  static AshourCubit get(context) => BlocProvider.of(context);

  void changeLanguageToEnglish(BuildContext context) {
    if (EasyLocalization.of(context)!.locale == const Locale('ar', 'EG')) {
      context.locale = const Locale('en', 'US');
      emit(ChangeLanToEnglish());
    }
  }

  void changeLanguageToArabic(BuildContext context) {
    if (EasyLocalization.of(context)!.locale == const Locale('en', 'US')) {
      context.locale = const Locale('ar', 'EG');
      emit(ChangeLanToArabic());
    }
  }

  List<Widget> screens = [
    HomeScreen(),
    CategoryScreen(),
    CartScreen(),
    ProfileScreen(),
  ];
  int currentIndex = 0;

  void bottomNavBar(int value) {
    currentIndex = value;
    emit(BottomNavBarState());
  }

  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  int categoryPage = 0;
  List<ContentModels> categories = [];
  CategoryModels? categoryModels;
  int? elements;
  bool getCategories({bool isRefresh = false}) {
    if (isRefresh) {
      categoryPage = 0;
    }
    emit(CategoryLoadingState());
    DioHelper.getData(
            url:
                'category?pageNo=$categoryPage&pageSize=10&sortBy=id&isDeleted=false')
        .then((value) {
      elements =value.data['totalElements'];
          print(value.data['totalElements'].toString());
      categoryModels = CategoryModels.fromJson(value.data);
      print(categoryModels!.totalElements.toString());
      if (isRefresh) {
        categories = categoryModels!.content;
      } else {
        categories.addAll(categoryModels!.content);
      }
      categoryPage++;
      emit(CategorySuccessLoadedState());
      return true;
    }).catchError((error) {
      emit(CategoryErrorState(error.toString()));
      print('$error when getting call categories');
    });
    return true;
  }

  CategoryIdModel? categoryIdModel;
  int productPage = 0;
  List<CategoryContent> products = [];

  bool getProductByID({int? id, bool isRefresh = false}) {
    if (isRefresh) {
      productPage = 0;
    }
    emit(ProductItemsLoadingState());
    DioHelper.getData(
            url:
                'product/category/$id?pageNo=$productPage&pageSize=10&sortBy=id')
        .then((value) {
      categoryIdModel = CategoryIdModel.fromJson(value.data);
      if (isRefresh) {
        products = categoryIdModel!.content;
      } else {
        products.addAll(categoryIdModel!.content);
      }
      productPage++;
      emit(ProductItemsSuccessLoadedState());
      return true;
    }).catchError((error) {
      emit(ProductItemsErrorState(error.toString()));
      print('$error when getting call categories');
    });
    return true;
  }
}
