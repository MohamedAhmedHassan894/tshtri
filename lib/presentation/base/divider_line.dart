import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/dimensions.dart';

class DividerLine extends StatelessWidget {
  const DividerLine({Key? key, this.height = 2, this.widthPercent = .4})
      : super(key: key);
  final double height;
  final double widthPercent;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: Dimensions.paddingSizeExtraLarge,
      ),
      color: Colors.grey[200],
      height: height.h,
      width: MediaQuery.of(context).size.width * widthPercent,
    );
  }
}
