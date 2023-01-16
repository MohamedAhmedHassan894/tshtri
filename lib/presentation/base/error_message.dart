import 'package:flutter/material.dart';
import '../../utils/styles.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Something wrong happen! , please Try again',
        textAlign: TextAlign.center,
        style: AppTextStyles.montserratMedium,
      ),
    );
  }
}
