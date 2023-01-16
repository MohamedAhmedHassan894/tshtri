import 'package:flutter/material.dart';
import 'package:tshtri/presentation/screens/layout/app_layout.dart';
import 'package:tshtri/presentation/screens/sell/sell_screen.dart';
import 'package:tshtri/presentation/screens/sell/submit_sell_screen.dart';
import '../data/repository/home_cat_repo.dart';
import '../data/webservices/home_webservices.dart';
import '../presentation/screens/home/home_screen.dart';
import '../presentation/screens/sell/ui_models/button_item_model.dart';
import '../utils/app_constants.dart';

class AppRouter {
  late HomeRepo homeRepo;
  AppRouter() {
    homeRepo = HomeRepo(HomeCatWebservices());
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppConstants.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case AppConstants.appLayoutScreen:
        return MaterialPageRoute(builder: (_) => const AppLayout());
      case AppConstants.sellScreen:
        return MaterialPageRoute(builder: (_) => SellScreen());
      case AppConstants.submitSellScreen:
        final selectedData = settings.arguments as List<ButtonItemModel>;
        return MaterialPageRoute(
          builder: (_) => SubmitSellScreen(
            itemsSelected: selectedData,
          ),
          settings: RouteSettings(
            arguments: selectedData,
          ),
        );
    }

    return null;
  }
}
