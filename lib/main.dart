import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tshtri/business_logic/provider/categories.dart';
import 'package:tshtri/data/repository/home_cat_repo.dart';
import 'package:tshtri/data/repository/sell_category_repo.dart';
import 'package:tshtri/data/webservices/home_webservices.dart';
import 'package:tshtri/data/webservices/sell_cat_webservices.dart';
import 'helpers/app_router.dart';
import 'helpers/dio_helper.dart';
import 'helpers/logger_helper.dart';
import 'themes/light_theme.dart';
import 'utils/strings.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LoggerHelper.init();
  DioHelper.init();
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.appRouter,
  }) : super(key: key);
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (context, _) => MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: CategoriesProvider(
              HomeRepo(
                HomeCatWebservices(),
              ),
              SellCatRepo(
                SellCatWebservices(),
              ),
            )..getHomeCat(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppStrings.appName,
          onGenerateRoute: appRouter.generateRoute,
          theme: lightTheme,
        ),
      ),
    );
  }
}
