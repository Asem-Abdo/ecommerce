import 'package:ecommerce/config/di/di.dart';
import 'package:ecommerce/features/ui/pages/home_screen/tabs/product_tab/cubit/product_tab_states.dart';
import 'package:ecommerce/features/ui/pages/home_screen/tabs/product_tab/cubit/product_tab_view_model.dart';
import 'package:ecommerce/features/widgets/main_error_widget.dart';
import 'package:ecommerce/features/widgets/main_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../widgets/product_tab_item.dart';

class ProductTab extends StatefulWidget {
  @override
  State<ProductTab> createState() => _ProductTabState();
}

class _ProductTabState extends State<ProductTab> {
  ProductTabViewModel viewModel = getIt<ProductTabViewModel>();
  @override
  void initState() {
    super.initState();
    viewModel.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductTabViewModel, ProductTabStates>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is ProductErrorState) {
          return MainErrorWidget(
            errorMessage: state.message,
            onTryAgain: viewModel.getProducts,
          );
        } else if (state is ProductSuccessState) {
          return SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 191.w / 237.h,
                      crossAxisSpacing: 16.w,
                      mainAxisSpacing: 16.h,
                    ),
                    itemCount: state.productsList!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          /// todo: navigate to product details screen
                        },
                        child: ProductTabItem(
                          product: state.productsList![index],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          return MainLoadingWidget();
        }
      },
    );
  }
}
