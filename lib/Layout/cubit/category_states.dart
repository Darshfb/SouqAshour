abstract class AshourStates {}

class InitialCategoryState extends AshourStates {}

class CategorySuccessLoadedState extends AshourStates {}

class CategoryLoadingState extends AshourStates {}

class ChangeLanToEnglish extends AshourStates {}

class ChangeLanToArabic extends AshourStates {}

class BottomNavBarState extends AshourStates {}

class LoadingState extends AshourStates {}

class CategoryErrorState extends AshourStates {
  final String error;

  CategoryErrorState(this.error);
}

class ProductItemsLoadingState extends AshourStates {}

class ProductItemsSuccessLoadedState extends AshourStates {}

class ProductItemsErrorState extends AshourStates {
  final String error;

  ProductItemsErrorState(this.error);
}

class OnRefreshState extends AshourStates {}

class OnLoadState extends AshourStates {}
