import 'package:flutter/material.dart';
import '../../../../utils/app_palette.dart';
import '../../../../utils/styles.dart';

class SellScreenButton extends StatelessWidget {
  const SellScreenButton({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text.toString(),
          style: AppTextStyles.montserratMedium,
        ),
        Container(
          decoration: const BoxDecoration(
              color: AppPalette.greenColor, shape: BoxShape.circle),
          child: const Icon(
            Icons.keyboard_arrow_down,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
