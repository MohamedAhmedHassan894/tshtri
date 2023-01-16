import 'package:flutter/material.dart';
import 'package:tshtri/utils/styles.dart';

class DefaultScreen extends StatelessWidget {
  const DefaultScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Data will be available soon',
        style: AppTextStyles.montserratMedium,
      ),
    );
  }
}
