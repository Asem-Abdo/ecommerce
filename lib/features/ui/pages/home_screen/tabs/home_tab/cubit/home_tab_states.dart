import 'package:ecommerce/domain/entities/response/category.dart';

abstract class HomeTabStates {}

class HomeTabInitialState extends HomeTabStates {}

class CategoryLoadingState extends HomeTabStates {}

class CategoryErrorState extends HomeTabStates {
  String message;
  CategoryErrorState({required this.message});
}

class CategorySuccessState extends HomeTabStates {
  List<Category>? categoriesList;
  CategorySuccessState({required this.categoriesList});
}

class BrandLoadingState extends HomeTabStates {}

class BrandErrorState extends HomeTabStates {
  String message;
  BrandErrorState({required this.message});
}

class BrandSuccessState extends HomeTabStates {
  List<Category>? brandsList;
  BrandSuccessState({required this.brandsList});
}
