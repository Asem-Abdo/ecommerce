import 'package:ecommerce/domain/entities/response/category.dart';

abstract class CategoryRepository {
  Future<List<Category>>? getAllCategories();
}
