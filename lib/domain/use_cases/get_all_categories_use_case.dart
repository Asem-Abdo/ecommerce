import 'package:ecommerce/domain/repositories/category/category_repository.dart';
import 'package:injectable/injectable.dart';
import '../entities/response/category.dart';

@injectable
class GetAllCategoriesUseCase {
  final CategoryRepository categoryRepository;

  GetAllCategoriesUseCase({required this.categoryRepository});

  Future<List<Category>>? invoke() {
    return categoryRepository.getAllCategories();
  }
}
