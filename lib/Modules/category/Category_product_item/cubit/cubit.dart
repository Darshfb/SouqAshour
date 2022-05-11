import 'package:ashour/Models/category_models/category_item_model.dart';
import 'package:ashour/Modules/category/Category_product_item/cubit/states.dart';
import 'package:ashour/Shared/Network/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductItemCubit extends Cubit<ProductItemStates> {
  ProductItemCubit() : super(InitialProductItemState());

  static ProductItemCubit get(context) => BlocProvider.of(context);
  ProductItemModel? productItemModel;

  void getProductItem({required int productId}) {
    emit(LoadProductItemState());
    DioHelper.getData(url: 'product/$productId').then((value) {
      productItemModel = ProductItemModel.fromJson(value.data);
      emit(SuccessProductItemState());
    }).catchError((error) {
      emit(ErrorProductItemState(error.toString()));
      print('$error when getting call product item');
    });
  }

  int increaseInCart = 1;
  void increaseProductItem()
  {
    //x = productItemModel!.quantityType + productItemModel!.quantityIncrement;
    if(increaseInCart < productItemModel!.maximumQuantity){
      increaseInCart ++;
    }
    //getProductItem(productId: productId);
    emit(IncreaseProductItemPriceState());
  }

  int decrementInCart = 1;
  void decreaseProductItem()
  {
    //x = productItemModel!.quantityType + productItemModel!.quantityIncrement;
    if(increaseInCart > productItemModel!.minimumQuantity){
      increaseInCart --;
    }
    //getProductItem(productId: productId);
    emit(DecreaseProductItemPriceState());
  }
}
