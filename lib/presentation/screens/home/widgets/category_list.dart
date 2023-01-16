import 'package:flutter/material.dart';
import '../../../../utils/app_size_boxes.dart';
import '../../../../data/models/home_ads_model.dart';
import '../../../../utils/styles.dart';
import 'item_card.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key, required this.category}) : super(key: key);
  final HomeCategoryDto? category;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          category?.name.toString()??'',
          style: AppTextStyles.montserratBold,
        ),
        10.heightBox,
        SizedBox(
          height: 220,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int position) => ItemCard(
              categoryCard: category?.cards![position],
            ),
            // separatorBuilder: (context, index) => 10.widthBox,
            itemCount: category?.cards?.length,
          ),
        ),
      ],
    );
  }
}
