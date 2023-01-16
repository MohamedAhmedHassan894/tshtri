import 'package:flutter/foundation.dart';
import '../../data/models/get_ad_category.dart';
import '../../data/models/home_ads_model.dart';
import '../../data/repository/home_cat_repo.dart';
import '../../helpers/logger_helper.dart';
import '../../data/repository/sell_category_repo.dart';

class CategoriesProvider with ChangeNotifier, DiagnosticableTreeMixin {
  CategoriesProvider(this.homeRepo, this.sellCatRepo);
  final HomeRepo homeRepo;
  final SellCatRepo sellCatRepo;
  bool _isLoading = false;
  List<HomeCategoryDto>? _categories = <HomeCategoryDto>[];
  bool get isLoading {
    return _isLoading;
  }

  List<HomeCategoryDto?> get categories {
    return List.from(_categories!);
  }

  Future<bool> getHomeCat() async {
    _isLoading = true;
    notifyListeners();
    try {
      final HomeAdsModel response = await homeRepo.getHomeCatData();
      if (response.statusCode == 200) {
        _categories = response.data?.homeCategoryDto;
      }
      _isLoading = false;
      notifyListeners();
      return Future.value(true);
    } catch (error) {
      LoggerHelper.logger.e("The error: $error");
      _isLoading = false;
      notifyListeners();
      return Future.value(false);
    }
  }

  Future<GetAdCategory?> getCatItems(int parentId) async {
    _isLoading = true;
    notifyListeners();
    try {
      final GetAdCategory response = await sellCatRepo.getCatItems(parentId);
      _isLoading = false;
      notifyListeners();
      return Future.value(response);
    } catch (error) {
      LoggerHelper.logger.e("The error: $error");
      _isLoading = false;
      notifyListeners();
      return Future.value(null);
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('isLoading', '$_isLoading'));
  }
}
