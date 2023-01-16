import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tshtri/utils/app_constants.dart';
import '../../../utils/app_palette.dart';
import '../../../presentation/screens/layout/widget/bottom_nav_item.dart';
import '../../../utils/dimensions.dart';
import '../favourite/fav_screen.dart';
import '../home/home_screen.dart';
import '../profile/profile_screen.dart';
import '../search/search_screen.dart';
import '../sell/sell_screen.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({
    Key? key,
  }) : super(key: key);

  @override
  _AppLayoutState createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  late PageController _pageController;
  int _pageIndex = 0;
  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
    _screens = [
      const HomeScreen(),
      const SearchScreen(),
       SellScreen(),
      const FavScreen(),
      const ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_pageIndex != 0) {
          _setPage(0);
          return false;
        } else {
          return false;
        }
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          elevation: 5,
          backgroundColor: AppPalette.secondaryColor,
          onPressed: () {
            Navigator.pushNamed(
              context,
              AppConstants.sellScreen,
            );
          },
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                 AppPalette.greenColor,
                  AppPalette.secondaryColor,
                  AppPalette.secondaryColor,
                ],
              ),
            ),
            child: Icon(
              Icons.add,
              color: AppPalette.whiteColor,
              size: 35.sp,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: AppPalette.whiteColor,
          elevation: 20,
          notchMargin: 8,
          clipBehavior: Clip.antiAlias,
          shape: const CircularNotchedRectangle(),
          child: Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width > 500
                ? Dimensions.paddingSizeLarge
                : Dimensions.paddingSizeExtraSmall),
            child: Row(children: [
              BottomNavItem(
                  iconData: Icons.home_sharp,
                  isSelected: _pageIndex == 0,
                  onTap: () => _setPage(0)),
              BottomNavItem(
                  iconData: Icons.search_outlined,
                  isSelected: _pageIndex == 1,
                  onTap: () => _setPage(1)),
              const Expanded(child: SizedBox()),
              BottomNavItem(
                  iconData: Icons.favorite_border_outlined,
                  isSelected: _pageIndex == 3,
                  onTap: () => _setPage(3)),
              BottomNavItem(
                  iconData: Icons.person,
                  isSelected: _pageIndex == 4,
                  onTap: () => _setPage(4)),
            ]),
          ),
        ),
        body: SafeArea(
          child: PageView.builder(
            controller: _pageController,
            itemCount: _screens.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return _screens[index];
            },
          ),
        ),
      ),
    );
  }

  void _setPage(int pageIndex) {
    setState(() {
      _pageController.jumpToPage(pageIndex);
      _pageIndex = pageIndex;
    });
  }
}
