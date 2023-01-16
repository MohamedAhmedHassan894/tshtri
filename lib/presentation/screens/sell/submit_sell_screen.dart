import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_size_boxes.dart';
import '../../../utils/app_palette.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/strings.dart';
import '../../../utils/styles.dart';
import '../../base/divider_line.dart';
import 'ui_models/button_item_model.dart';

class SubmitSellScreen extends StatelessWidget {
  SubmitSellScreen({Key? key, this.itemsSelected}) : super(key: key);
  List<ButtonItemModel>? itemsSelected = [];
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: itemsSelected!.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const DividerLine(),
              itemBuilder: (BuildContext context, int index) {
                return SelectedItem(
                  text: itemsSelected![index].itemText,
                );
              },
            ),
            ElevatedButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
              ),
              onPressed: () async {},
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
                    AppStrings.next,
                    style: AppTextStyles.montserratBold.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectedItem extends StatelessWidget {
  const SelectedItem({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        Dimensions.paddingSizeLarge,
      ),
      child: Row(
        children: [
          const Icon(
            Icons.check,
            color: AppPalette.greenColor,
          ),
          10.widthBox,
          Text(
            text.toString(),
            style: AppTextStyles.montserratMedium,
          ),
        ],
      ),
    );
  }
}
