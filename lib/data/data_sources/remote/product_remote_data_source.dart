import 'package:ecommerce/domain/entities/response/product.dart';

abstract class ProductRemoteDataSource {
  Future<List<Product>> getAllProducts();
}
