import 'package:ecommerce/config/di/di.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:ecommerce/domain/entities/response/category.dart';
import 'package:ecommerce/features/ui/pages/home_screen/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:ecommerce/features/ui/pages/home_screen/tabs/home_tab/cubit/home_tab_view_model.dart';
import 'package:ecommerce/features/widgets/main_error_widget.dart';
import 'package:ecommerce/features/widgets/main_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../widgets/category_brand_item.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getCategories();
    viewModel.getBrands();
  }

  HomeTabViewModel viewModel = getIt<HomeTabViewModel>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.h),
          _buildAnnouncement(images: viewModel.imagesList),
          SizedBox(height: 24.h),
          _lineBreak(name: "Categories"),
          BlocBuilder<HomeTabViewModel, HomeTabStates>(
            bloc: viewModel,
            buildWhen: (previous, current) {
              return current is CategorySuccessState ||
                  current is CategoryErrorState ||
                  current is CategoryLoadingState;
            },
            builder: (context, state) {
              if (state is CategoryErrorState) {
                return MainErrorWidget(
                  errorMessage: state.message,
                  onTryAgain: () => viewModel.getCategories(),
                );
              } else if (state is CategorySuccessState) {
                return _buildCategoryBrandSec(
                  categoriesList: state.categoriesList ?? [],
                );
              } else {
                return const MainLoadingWidget();
              }
            },
          ),
          _lineBreak(name: "Brands"),
          BlocBuilder<HomeTabViewModel, HomeTabStates>(
            bloc: viewModel,
            buildWhen: (previous, current) =>
                current is BrandSuccessState ||
                current is BrandErrorState ||
                current is BrandLoadingState,
            builder: (context, state) {
              if (state is BrandErrorState) {
                return MainErrorWidget(
                  errorMessage: state.message,
                  onTryAgain: viewModel.getBrands,
                );
              } else if (state is BrandSuccessState) {
                return _buildCategoryBrandSec(
                  categoriesList: state.brandsList ?? [],
                );
              } else {
                return const MainLoadingWidget();
              }
            },
          ),
        ],
      ),
    );
  }

  ImageSlideshow _buildAnnouncement({required List<String> images}) {
    return ImageSlideshow(
      indicatorColor: AppColors.primaryColor,
      initialPage: 0,
      indicatorBottomPadding: 15.h,
      indicatorPadding: 8.w,
      indicatorRadius: 5,
      indicatorBackgroundColor: AppColors.whiteColor,
      isLoop: true,
      autoPlayInterval: 3000,
      height: 190.h,
      children: images.map((url) {
        return Image.asset(url, fit: BoxFit.fill);
      }).toList(),
    );
  }

  Widget _lineBreak({required String name}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name, style: AppStyles.medium18Header),
        TextButton(
          onPressed: () {
            /// navigate to view all
          },
          child: Text('View All', style: AppStyles.regular12Text),
        ),
      ],
    );
  }

  SizedBox _buildCategoryBrandSec({required List<Category> categoriesList}) {
    return SizedBox(
      height: 250.h,
      width: double.infinity,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16.h,
          crossAxisSpacing: 16.w,
        ),
        itemCount: categoriesList.length,
        scrollDirection: Axis.horizontal,
        physics: const ScrollPhysics(),
        itemBuilder: (context, index) {
          return CategoryBrandItem(item: categoriesList[index]);
        },
      ),
    );
  }
}
