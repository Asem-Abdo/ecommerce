import 'package:ecommerce/api/model/response/common/category_dto.dart';
import 'package:ecommerce/api/model/response/common/meta_data_dto.dart';

import 'category.dart';
import 'meta_data.dart';

class BrandResponse {
  final int? results;
  final Metadata? metadata;
  final List<Category>? data;

  BrandResponse({this.results, this.metadata, this.data});
}
