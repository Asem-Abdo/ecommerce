import 'category.dart';
import 'meta_data.dart';

class CategoryResponseDto {
  final int? results;
  final Metadata? metadata;
  final List<Category>? categoryDto;

  CategoryResponseDto({this.results, this.metadata, this.categoryDto});
}
