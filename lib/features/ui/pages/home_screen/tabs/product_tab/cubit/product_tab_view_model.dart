import 'package:ecommerce/core/exceptions/app_exception.dart';
import 'package:ecommerce/features/ui/pages/home_screen/tabs/product_tab/cubit/product_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../../domain/use_cases/get_all_products_use_case.dart';

@injectable
class ProductTabViewModel extends Cubit<ProductTabStates> {
  GetAllProductsUseCase getAllProductsUseCase;

  ProductTabViewModel({required this.getAllProductsUseCase})
    : super(ProductTabInitialState());

  /// hold data & handel logic

  void getProducts() async {
    try {
      emit(ProductLoadingState());
      var productsList = await getAllProductsUseCase.invoke();
      emit(ProductSuccessState(productsList: productsList));
    } on AppException catch (e) {
      emit(ProductErrorState(message: e.message));
    }
  }
}
