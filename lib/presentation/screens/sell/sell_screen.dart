import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../utils/app_constants.dart';
import '../../base/divider_line.dart';
import 'ui_models/button_item_model.dart';
import 'widgets/bottom_sheet_item.dart';
import 'widgets/sell_screen_button.dart';
import '../../base/loading_widget.dart';
import '../../../utils/app_size_boxes.dart';
import '../../../business_logic/provider/categories.dart';
import '../../../utils/app_palette.dart';
import '../../../utils/styles.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/strings.dart';

class SellScreen extends StatelessWidget {
  final ButtonStyle buttonStyle = ButtonStyle(
    padding: MaterialStateProperty.all(
      EdgeInsets.all(
        Dimensions.paddingSizeLarge,
      ),
    ),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
    ),
    backgroundColor: MaterialStateProperty.all(
      AppPalette.whiteColor,
    ),
    shadowColor: MaterialStateProperty.all(
      AppPalette.shadowColor,
    ),
    elevation: MaterialStateProperty.all(
      20,
    ),
  );

  List<ButtonItemModel> itemsSelected = [
    ButtonItemModel(
      itemText: AppStrings.category,
    ),
  ];

  SellScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.sellNow,
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_outlined,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSizeLarge,
          vertical: Dimensions.paddingSizeLarge,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.adCategory,
              style: AppTextStyles.montserratBold.copyWith(
                color: AppPalette.secondaryColor,
              ),
            ),
            30.heightBox,
            Provider.of<CategoriesProvider>(context).isLoading
                ? const LoadingWidget()
                : Expanded(
                    child: ListView.separated(
                      itemCount: itemsSelected.length,
                      separatorBuilder: (BuildContext context, int index) =>
                          16.heightBox,
                      itemBuilder: (context, index) => ElevatedButton(
                        style: buttonStyle,
                        onPressed: () {
                          if (itemsSelected.length > 1) {
                            if (index == itemsSelected.length - 1) {
                              selectItem(
                                  provider: Provider.of<CategoriesProvider>(
                                    context,
                                    listen: false,
                                  ),
                                  context: context,
                                  isCategorySelection: true);
                            }
                          } else {
                            selectItem(
                              provider: Provider.of<CategoriesProvider>(
                                context,
                                listen: false,
                              ),
                              context: context,
                            );
                          }
                        },
                        child: SellScreenButton(
                          text: itemsSelected[index].itemText,
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  void selectItem(
      {required CategoriesProvider provider,
      bool isCategorySelection = false,
      required BuildContext context}) {
    int selectedItem = 0;
    showModalBottomSheet(
      shape: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.transparent,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            Dimensions.radiusExtraExtraLarge,
          ),
          topRight: Radius.circular(
            Dimensions.radiusExtraExtraLarge,
          ),
        ),
      ),
      context: context,
      builder: (context) => Column(
        children: [
          30.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                itemsSelected.length > 1
                    ? AppStrings.selectSubCategory
                    : AppStrings.selectCategory,
                textAlign: TextAlign.center,
                style: AppTextStyles.montserratBold.copyWith(
                  color: AppPalette.secondaryColor,
                  fontSize: Dimensions.fontSizeLarge,
                ),
              ),
            ],
          ),
          30.heightBox,
          Expanded(
            child: StatefulBuilder(
              builder: (BuildContext context,
                  void Function(void Function()) changeSelectedItem) {
                return itemsSelected.length > 2 &&
                        itemsSelected[itemsSelected.length - 2]
                            .getAdCategory!
                            .data!
                            .isEmpty
                    ? const Center(
                        child: Text(
                          AppStrings.noSubCatFound,
                        ),
                      )
                    : ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemCount: isCategorySelection
                            ? itemsSelected[itemsSelected.length - 2]
                                .getAdCategory!
                                .data!
                                .length
                            : provider.categories.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            const DividerLine(),
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              changeSelectedItem(
                                () {
                                  selectedItem = index;
                                },
                              );
                            },
                            child: BottomSheetItem(
                              text: isCategorySelection
                                  ? itemsSelected[itemsSelected.length - 2]
                                      .getAdCategory!
                                      .data![index]
                                      .name!
                                  : provider.categories[index]?.name ?? '-',
                              isSelected: index == selectedItem ? true : false,
                            ),
                          );
                        },
                      );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: Dimensions.paddingSizeLarge,
            ),
            child: ElevatedButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
              ),
              onPressed: () async {
                if (itemsSelected.length > 2 &&
                    itemsSelected[itemsSelected.length - 2]
                        .getAdCategory!
                        .data!
                        .isEmpty) {
                  Navigator.pop(context);
                  itemsSelected.removeAt(itemsSelected.length - 1);
                  Navigator.pushReplacementNamed(
                    context,
                    AppConstants.submitSellScreen,
                    arguments: itemsSelected,
                  );
                  return;
                }
                late final getAdCategory;
                Navigator.pop(context);
                if (itemsSelected.length > 1) {
                  getAdCategory = await provider.getCatItems(
                    itemsSelected[itemsSelected.length - 2]
                        .getAdCategory!
                        .data![selectedItem]
                        .categoryId!,
                  );
                } else {
                  getAdCategory = await provider.getCatItems(
                    provider.categories[selectedItem]!.categoryId!,
                  );
                }
                itemsSelected.insert(
                  itemsSelected.length > 1 ? itemsSelected.length - 1 : 0,
                  ButtonItemModel(
                    itemText: isCategorySelection
                        ? itemsSelected[itemsSelected.length - 2]
                            .getAdCategory!
                            .data![selectedItem]
                            .name!
                        : provider.categories[selectedItem]!.name!,
                    id: isCategorySelection
                        ? itemsSelected[itemsSelected.length - 2]
                            .getAdCategory!
                            .data![selectedItem]
                            .categoryId
                        : provider.categories[selectedItem]!.categoryId,
                    getAdCategory: getAdCategory,
                  ),
                );
                if (itemsSelected.length > 1) {
                  itemsSelected[itemsSelected.length - 1] = ButtonItemModel(
                    itemText: AppStrings.subCategory,
                  );
                } else {
                  itemsSelected[0].itemText = AppStrings.category;
                }
              },
              child: Container(
                width: 283.w,
                height: 55.h,
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        AppPalette.greenColor,
                        AppPalette.secondaryColor,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(30.0)),
                child: Center(
                  child: Text(
                    itemsSelected.length > 2 &&
                            itemsSelected[itemsSelected.length - 2]
                                .getAdCategory!
                                .data!
                                .isEmpty
                        ? AppStrings.next
                        : AppStrings.submit,
                    style: AppTextStyles.montserratBold.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
