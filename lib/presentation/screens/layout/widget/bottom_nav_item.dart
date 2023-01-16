import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavItem extends StatelessWidget {
  final IconData iconData;
  final Function()? onTap;
  final bool isSelected;
  const BottomNavItem(
      {required this.iconData, this.onTap, this.isSelected = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: IconButton(
        icon: Icon(iconData,
            color: isSelected ? Theme.of(context).primaryColor : Colors.grey,
            size: 25.sp),
        onPressed: onTap,
      ),
    );
  }
}
