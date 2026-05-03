import 'package:ecommerce/domain/entities/response/product.dart';

abstract class ProductRepository {
  Future<List<Product>>? getAllProducts();
}
