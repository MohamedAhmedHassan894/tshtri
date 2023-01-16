import 'package:dio/dio.dart';
import '../../helpers/dio_helper.dart';
import '../../utils/app_constants.dart';

class HomeCatWebservices {
  Future<dynamic> getHomeCatData() async {
    try {
      Response response =
          await DioHelper.getData(uri: AppConstants.homeCategories, lang: 'en');
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
