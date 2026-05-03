import 'package:ecommerce/domain/entities/response/category.dart';

abstract class CategoryRemoteDataSource {
  Future<List<Category>> getAllCategories();
}
