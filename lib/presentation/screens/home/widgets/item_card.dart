import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tshtri/data/models/home_ads_model.dart';
import 'package:tshtri/utils/app_palette.dart';
import 'package:tshtri/utils/app_size_boxes.dart';
import 'package:tshtri/utils/styles.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
    required this.categoryCard,
  }) : super(key: key);
  final CategoryCard? categoryCard;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            20.r,
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              AppPalette.shadowColor.withOpacity(
                .1,
              ),
            ],
          ),
        ),
        child: Card(
          margin: EdgeInsets.all(
            6.r,
          ),
          shape: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade200,
            ),
            borderRadius: BorderRadius.circular(
              20.r,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: FadeInImage(
                  height: 100.h,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.contain,
                  imageErrorBuilder: (context, error, stackTrace) => Image(
                    image: const ExactAssetImage(
                      'assets/images/placholderImage.png',
                    ),
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                  ),
                  placeholder:
                      const AssetImage('assets/images/placholderImage.png'),
                  image: NetworkImage(
                    categoryCard!.image!,
                  ),
                  fadeInDuration: const Duration(milliseconds: 300),
                ),
              ),
              15.heightBox,
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      categoryCard?.name
                              ?.toString()
                              .replaceAll('[', '')
                              .replaceAll(']', '') ??
                          '-',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.montserratBold
                          .copyWith(color: AppPalette.secondaryColor),
                    ),
                    14.heightBox,
                    Text(
                      categoryCard?.price.toString() ?? '-',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.montserratLight,
                    ),
                    7.heightBox,
                    Text(
                      categoryCard?.city.toString() ?? '-',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.montserratLight,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
