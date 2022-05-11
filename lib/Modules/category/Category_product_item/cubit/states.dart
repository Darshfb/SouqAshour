abstract class ProductItemStates {}

class InitialProductItemState extends ProductItemStates {}

class LoadProductItemState extends ProductItemStates {}

class SuccessProductItemState extends ProductItemStates {}

class ErrorProductItemState extends ProductItemStates {
  final String error;

  ErrorProductItemState(this.error);
}

class IncreaseProductItemPriceState extends ProductItemStates {}

class DecreaseProductItemPriceState extends ProductItemStates {}
