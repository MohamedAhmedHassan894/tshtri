import 'package:flutter/material.dart';
import '../../../../utils/app_palette.dart';
import '../../../../utils/dimensions.dart';
import '../../../../utils/styles.dart';

class BottomSheetItem extends StatelessWidget {
  BottomSheetItem({Key? key, this.isSelected = false, required this.text})
      : super(key: key);
  late bool isSelected;
  String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        Dimensions.paddingSizeLarge,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text.toString(),
            style: AppTextStyles.montserratMedium,
          ),
          Icon(
            Icons.check,
            color: isSelected ? AppPalette.greenColor : Colors.transparent,
          ),
        ],
      ),
    );
  }
}
