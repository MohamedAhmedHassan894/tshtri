import '../../../../data/models/get_ad_category.dart';

class ButtonItemModel {
  late String itemText;
  GetAdCategory? getAdCategory;
  int? id;
  ButtonItemModel({
    required this.itemText,
    this.id,
    this.getAdCategory,
  });
}
