import 'package:ecommerce/domain/entities/response/category.dart';

abstract class BrandRepository {
  Future<List<Category>> getAllBrands();
}
