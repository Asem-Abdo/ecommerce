import 'package:ecommerce/core/exceptions/app_exception.dart';
import 'package:ecommerce/domain/use_cases/get_all_brands_use_case.dart';
import 'package:ecommerce/domain/use_cases/get_all_categories_use_case.dart';
import 'package:ecommerce/features/ui/pages/home_screen/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../core/utils/app_assets.dart';

@injectable
class HomeTabViewModel extends Cubit<HomeTabStates> {
  GetAllCategoriesUseCase getAllCategoriesUseCase;
  GetAllBrandsUseCase getAllBrandsUseCase;
  HomeTabViewModel({
    required this.getAllCategoriesUseCase,
    required this.getAllBrandsUseCase,
  }) : super(HomeTabInitialState());

  /// hold data & handel logic

  List<String> imagesList = [
    AppAssets.announcement1,
    AppAssets.announcement2,
    AppAssets.announcement3,
  ];

  void getCategories() async {
    try {
      emit(CategoryLoadingState());
      var categoriesList = await getAllCategoriesUseCase.invoke();
      emit(CategorySuccessState(categoriesList: categoriesList));
    } on AppException catch (e) {
      emit(CategoryErrorState(message: e.message));
    }
  }

  void getBrands() async {
    try {
      emit(BrandLoadingState());
      var brandsList = await getAllBrandsUseCase.invoke();
      emit(BrandSuccessState(brandsList: brandsList));
    } on AppException catch (e) {
      emit(BrandErrorState(message: e.message));
    }
  }
}
