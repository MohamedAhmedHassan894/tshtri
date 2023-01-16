import 'package:dio/dio.dart';
import '../../helpers/dio_helper.dart';
import '../../utils/app_constants.dart';

class SellCatWebservices {
  Future<dynamic> getCatItems(int parentId) async {
    try {
      Response response = await DioHelper.getData(
        uri: AppConstants.getCategoryItems,
        query: {
          'ParentId': parentId,
        },
        lang: 'en',
      );
      return response.data;
    } catch (error) {
      return Future.error(
        "Home categories get data error  ",
        StackTrace.fromString(
          ('this is its trace'),
        ),
      );
    }
  }
}
