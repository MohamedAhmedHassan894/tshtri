import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../business_logic/provider/categories.dart';
import '../../../utils/app_size_boxes.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/strings.dart';
import '../../base/custom_text_field.dart';
import '../../base/loading_widget.dart';
import 'widgets/category_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.helloMessage,
        ),
        leading: const Icon(
          Icons.menu,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSizeLarge,
            vertical: Dimensions.paddingSizeSmall,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextField(
                hintText: AppStrings.search,
                prefixIcon: Icons.search,
                suffixIcon: Icons.menu_open,
                isEnabled: false,
                smallPadding: true,
              ),
              30.heightBox,
              Provider.of<CategoriesProvider>(context).isLoading
                  ? const LoadingWidget()
                  : ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (BuildContext context, int index) =>
                          20.heightBox,
                      itemBuilder: (BuildContext context, int index) =>
                          CategoryList(
                        category: Provider.of<CategoriesProvider>(context)
                            .categories[index],
                      ),
                      itemCount: Provider.of<CategoriesProvider>(context)
                          .categories
                          .length,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
