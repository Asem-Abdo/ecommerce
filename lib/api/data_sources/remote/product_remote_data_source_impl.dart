import 'package:ecommerce/api/mapper/category_mapper.dart';
import 'package:ecommerce/api/mapper/product_mapper.dart';
import 'package:ecommerce/api/web_services.dart';
import 'package:ecommerce/core/exceptions/app_exception.dart';
import 'package:ecommerce/data/data_sources/remote/category_remote_data_source.dart';
import 'package:ecommerce/domain/entities/response/category.dart';
import 'package:ecommerce/domain/entities/response/product.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';

import '../../../data/data_sources/remote/brand_remote_data_source.dart';
import '../../../data/data_sources/remote/product_remote_data_source.dart';

@Injectable(as: ProductRemoteDataSource)
class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  WebServices webServices;

  ProductRemoteDataSourceImpl({required this.webServices});
  @override
  Future<List<Product>> getAllProducts() async {
    try {
      var productResponse = await webServices.getAllProducts();

      ///todo: CategoryDto => Category
      return productResponse.data?.map((e) => e.toProduct()).toList() ?? [];
    } on DioException catch (e) {
      String message = (e.error as AppException).message;
      throw ServerException(message: message);
    }
  }
}
