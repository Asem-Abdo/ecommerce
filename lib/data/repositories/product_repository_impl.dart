import 'package:ecommerce/data/data_sources/remote/category_remote_data_source.dart';
import 'package:ecommerce/domain/entities/response/category.dart';
import 'package:ecommerce/domain/entities/response/product.dart';
import 'package:ecommerce/domain/repositories/brand/brand_repository.dart';
import 'package:ecommerce/domain/repositories/category/category_repository.dart';
import 'package:ecommerce/domain/repositories/category/product_repository.dart';
import 'package:injectable/injectable.dart';

import '../data_sources/remote/brand_remote_data_source.dart';
import '../data_sources/remote/product_remote_data_source.dart';

@Injectable(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Product>>? getAllProducts() {
    return remoteDataSource.getAllProducts();
  }
}
