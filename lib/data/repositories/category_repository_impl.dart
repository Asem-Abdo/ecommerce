import 'package:ecommerce/data/data_sources/remote/category_remote_data_source.dart';
import 'package:ecommerce/domain/entities/response/category.dart';
import 'package:ecommerce/domain/repositories/category/category_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoryRepository)
class CategoryRepositoryImpl implements CategoryRepository {
  CategoryRemoteDataSource remoteDataSource;

  CategoryRepositoryImpl({required this.remoteDataSource});
  @override
  Future<List<Category>>? getAllCategories() {
    return remoteDataSource.getAllCategories();
  }
}
