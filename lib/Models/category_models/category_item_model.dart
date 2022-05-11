class ProductItemModel {
  int? id;
  String? productNameAr;
  String? productNameEn;
  dynamic price;
  dynamic maximumQuantity;
  dynamic minimumQuantity;
  dynamic quantityIncrement;
  dynamic quantityType;

  ProductItemModel.fromJson(Map<String, dynamic> json)
  {
    id = json['id'];
    productNameAr = json['productNameAr'];
    productNameEn = json['productNameEn'];
    price = json['price'];
    maximumQuantity = json['maximumQuantity'];
    minimumQuantity = json['minimumQuantity'];
    quantityIncrement = json['quantityIncrement'];
    quantityType = json['quantityType'];
  }
}
