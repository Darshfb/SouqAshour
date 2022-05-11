class CategoryModels {
  List<ContentModels> content = [];
  bool? last;
  int? totalPages;
  Pageable? pageable;
  int? size;
  dynamic totalElements;

  CategoryModels.fromJson(Map<String, dynamic> json) {
    json['content'].forEach((element) {
      content.add(ContentModels.fromJson(element));
    });
    last = json['last'];
    totalPages = json['totalPages'];
    size = json['size'];
    size = json['totalElements'];
    pageable = json['Pageable'] != null ? Pageable.fromJson(json['Pageable']) : null;
  }
}

class ContentModels {
  int? id;
  String? addDate;
  String? categoryNameAr;
  String? categoryNameEn;

  ContentModels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    addDate = json['addDate'];
    categoryNameAr = json['categoryNameAr'];
    categoryNameEn = json['categoryNameEn'];
  }
}

class Pageable{
  int? pageNumber;
  Pageable.fromJson(Map<String, dynamic> json)
  {
    pageNumber = json['pageNumber'];
  }
}
