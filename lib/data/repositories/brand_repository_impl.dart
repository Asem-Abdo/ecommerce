import 'package:ecommerce/data/data_sources/remote/category_remote_data_source.dart';
import 'package:ecommerce/domain/entities/response/category.dart';
import 'package:ecommerce/domain/repositories/brand/brand_repository.dart';
import 'package:ecommerce/domain/repositories/category/category_repository.dart';
import 'package:injectable/injectable.dart';

import '../data_sources/remote/brand_remote_data_source.dart';

@Injectable(as: BrandRepository)
class BrandRepositoryImpl implements BrandRepository {
  BrandRemoteDataSource remoteDataSource;

  BrandRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Category>> getAllBrands() {
    return remoteDataSource.getAllBrands();
  }
}
