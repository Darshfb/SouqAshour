class CategoryIdModel {
  List<CategoryContent> content = [];

  CategoryIdModel.fromJson(Map<String, dynamic> json) {
    json['content'].forEach((element) {
      content.add(CategoryContent.fromJson(element));
    });
  }
}

class CategoryContent {
  int? id;
  int? categoryId;
  String? productNameAr;
  String? productNameEn;
  String? descriptionAr;
  double? maximumQuantity;
  double? minimumQuantity;
  double? quantityIncrement;
  int? quantityType;
  bool? available;
  dynamic price;

  CategoryContent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['categoryId'];
    productNameAr = json['productNameAr'];
    productNameEn = json['productNameEn'];
    descriptionAr = json['descriptionAr'];
    maximumQuantity = json['maximumQuantity'];
    minimumQuantity = json['minimumQuantity'];
    quantityIncrement = json['quantityIncrement'];
    quantityType = json['quantityType'];
    available = json['available'];
    price = json['price'];
  }
}
