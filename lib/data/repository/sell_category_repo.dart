import 'dart:async';
import '../models/get_ad_category.dart';
import '../webservices/sell_cat_webservices.dart';

class SellCatRepo {
  final SellCatWebservices sellCatWebservices;
  SellCatRepo(this.sellCatWebservices);
  Future<GetAdCategory> getCatItems(int parentId) async {
    final catItemsResponse = await sellCatWebservices.getCatItems(parentId);
    return GetAdCategory.fromJson(catItemsResponse);
  }
}
