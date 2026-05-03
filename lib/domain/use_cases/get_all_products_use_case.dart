import 'package:ecommerce/domain/entities/response/product.dart';
import 'package:ecommerce/domain/repositories/category/product_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllProductsUseCase {
  final ProductRepository productRepository;

  GetAllProductsUseCase({required this.productRepository});

  Future<List<Product>>? invoke() {
    return productRepository.getAllProducts();
  }
}
