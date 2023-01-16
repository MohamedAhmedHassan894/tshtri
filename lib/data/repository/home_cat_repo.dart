import 'dart:async';
import '../models/home_ads_model.dart';
import '../webservices/home_webservices.dart';

class HomeRepo {
  final HomeCatWebservices homeCatWebservices;
  HomeRepo(this.homeCatWebservices);
  Future<HomeAdsModel> getHomeCatData() async {
    final homeDataResponse = await homeCatWebservices.getHomeCatData();
    return HomeAdsModel.fromJson(homeDataResponse);
  }
}
