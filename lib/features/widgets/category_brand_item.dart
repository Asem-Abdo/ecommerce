import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:ecommerce/domain/entities/response/category.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryBrandItem extends StatelessWidget {
  final Category item;
  const CategoryBrandItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 8,
          child: CachedNetworkImage(
            width: double.infinity,
            fit: BoxFit.cover,
            height: 10.h,
            imageUrl: item.image ?? '',
            imageBuilder: (context, imageProvider) {
              return CircleAvatar(backgroundImage: imageProvider, radius: 50.r);
            },
            placeholder: (context, url) => Center(
              child: CircularProgressIndicator(color: AppColors.primaryDark),
            ),
            errorWidget: (context, url, error) =>
                const Icon(Icons.error, color: AppColors.redColor),
          ),
        ),
        SizedBox(height: 8.h),
        Expanded(
          flex: 4,
          child: Text(
            item.name ?? '',
            textWidthBasis: TextWidthBasis.longestLine,
            softWrap: true,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColors.primaryDark,
              fontWeight: FontWeight.normal,
              fontSize: 14.sp,
            ),
          ),
        ),
      ],
    );
  }
}
