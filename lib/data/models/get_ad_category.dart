/// statusCode : 200
/// message : ""
/// data : [{"categoryId":1097,"name":"Vehicles","image":"https://tshtri.com/Images/Categories/1097_3252-1097.png","mobileImage":"https://tshtri.com/Images/Categories/1097_506-1097.png","bannerImage":"https://tshtri.com/Images/Categories/","subCategoryCount":10,"ads":0},{"categoryId":1027,"name":"Real Estate","image":"https://tshtri.com/Images/Categories/1027_4577-1027.png","mobileImage":"https://tshtri.com/Images/Categories/1027_8697-1027.png","bannerImage":"https://tshtri.com/Images/Categories/","subCategoryCount":18,"ads":0},{"categoryId":1047,"name":"Electronic Devices","image":"https://tshtri.com/Images/Categories/1047_3121-1047.png","mobileImage":"https://tshtri.com/Images/Categories/1047_7634-1047.png","bannerImage":"https://tshtri.com/Images/Categories/","subCategoryCount":6,"ads":0},{"categoryId":1128,"name":"Home Appliances","image":"https://tshtri.com/Images/Categories/1128_8755-1128.png","mobileImage":"https://tshtri.com/Images/Categories/1128_9757-1128.png","bannerImage":"https://tshtri.com/Images/Categories/","subCategoryCount":5,"ads":0},{"categoryId":1174,"name":"Furniture","image":"https://tshtri.com/Images/Categories/1174_4088-1174.png","mobileImage":"https://tshtri.com/Images/Categories/1174_5056-1174.png","bannerImage":"https://tshtri.com/Images/Categories/","subCategoryCount":8,"ads":0},{"categoryId":1397,"name":"Fashion and Beauty","image":"https://tshtri.com/Images/Categories/1397_4563-1397.png","mobileImage":"https://tshtri.com/Images/Categories/1397_9919-1397.png","bannerImage":"https://tshtri.com/Images/Categories/","subCategoryCount":3,"ads":0},{"categoryId":1346,"name":"Nutritions","image":"https://tshtri.com/Images/Categories/1346_659-1346.png","mobileImage":"https://tshtri.com/Images/Categories/1346_8504-1346.png","bannerImage":"https://tshtri.com/Images/Categories/","subCategoryCount":2,"ads":0},{"categoryId":1456,"name":"Sports and Games","image":"https://tshtri.com/Images/Categories/1456.png","mobileImage":"https://tshtri.com/Images/Categories/","bannerImage":"https://tshtri.com/Images/Categories/","subCategoryCount":2,"ads":0},{"categoryId":1425,"name":"Books","image":"https://tshtri.com/Images/Categories/1425.png","mobileImage":"https://tshtri.com/Images/Categories/","bannerImage":"https://tshtri.com/Images/Categories/","subCategoryCount":14,"ads":0},{"categoryId":1270,"name":"Animals","image":"https://tshtri.com/Images/Categories/1270.png","mobileImage":"https://tshtri.com/Images/Categories/","bannerImage":"https://tshtri.com/Images/Categories/","subCategoryCount":7,"ads":0},{"categoryId":1258,"name":"Musical Instruments","image":"https://tshtri.com/Images/Categories/1258.png","mobileImage":"https://tshtri.com/Images/Categories/","bannerImage":"https://tshtri.com/Images/Categories/","subCategoryCount":7,"ads":0},{"categoryId":1334,"name":"Other products and services","image":"https://tshtri.com/Images/Categories/1334.png","mobileImage":"https://tshtri.com/Images/Categories/","bannerImage":"https://tshtri.com/Images/Categories/","subCategoryCount":2,"ads":0}]

class GetAdCategory {
  GetAdCategory({
      this.statusCode, 
      this.message, 
      this.data,});

  GetAdCategory.fromJson(dynamic json) {
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  int? statusCode;
  String? message;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusCode'] = statusCode;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// categoryId : 1097
/// name : "Vehicles"
/// image : "https://tshtri.com/Images/Categories/1097_3252-1097.png"
/// mobileImage : "https://tshtri.com/Images/Categories/1097_506-1097.png"
/// bannerImage : "https://tshtri.com/Images/Categories/"
/// subCategoryCount : 10
/// ads : 0

class Data {
  Data({
      this.categoryId, 
      this.name, 
      this.image, 
      this.mobileImage, 
      this.bannerImage, 
      this.subCategoryCount, 
      this.ads,});

  Data.fromJson(dynamic json) {
    categoryId = json['categoryId'];
    name = json['name'];
    image = json['image'];
    mobileImage = json['mobileImage'];
    bannerImage = json['bannerImage'];
    subCategoryCount = json['subCategoryCount'];
    ads = json['ads'];
  }
  int? categoryId;
  String? name;
  String? image;
  String? mobileImage;
  String? bannerImage;
  int? subCategoryCount;
  int? ads;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['categoryId'] = categoryId;
    map['name'] = name;
    map['image'] = image;
    map['mobileImage'] = mobileImage;
    map['bannerImage'] = bannerImage;
    map['subCategoryCount'] = subCategoryCount;
    map['ads'] = ads;
    return map;
  }

}