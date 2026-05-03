import 'package:ecommerce/domain/entities/response/category.dart';

abstract class BrandRemoteDataSource {
  Future<List<Category>> getAllBrands();
}
