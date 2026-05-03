import 'package:ecommerce/api/mapper/category_mapper.dart';
import 'package:ecommerce/api/web_services.dart';
import 'package:ecommerce/core/exceptions/app_exception.dart';
import 'package:ecommerce/data/data_sources/remote/category_remote_data_source.dart';
import 'package:ecommerce/domain/entities/response/category.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';

@Injectable(as: CategoryRemoteDataSource)
class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  WebServices webServices;

  CategoryRemoteDataSourceImpl({required this.webServices});
  @override
  Future<List<Category>> getAllCategories() async {
    try {
      var categoryResponse = await webServices.getAllCategories();

      ///todo: CategoryDto => Category
      return categoryResponse.categoryDto
              ?.map((e) => e.toCategory())
              .toList() ??
          [];
    } on DioException catch (e) {
      String message = (e.error as AppException).message;
      throw ServerException(message: message);
    }
  }
}
