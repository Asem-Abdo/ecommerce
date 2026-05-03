import 'package:ecommerce/domain/repositories/brand/brand_repository.dart';
import 'package:injectable/injectable.dart';
import '../entities/response/category.dart';

@injectable
class GetAllBrandsUseCase {
  final BrandRepository brandRepository;

  GetAllBrandsUseCase({required this.brandRepository});

  Future<List<Category>>? invoke() {
    return brandRepository.getAllBrands();
  }
}
