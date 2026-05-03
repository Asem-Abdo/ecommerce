import 'package:ecommerce/api/model/response/common/meta_data_dto.dart';
import 'package:ecommerce/api/model/response/products/product_dto.dart';
import 'package:ecommerce/domain/entities/response/product.dart';
import 'package:json_annotation/json_annotation.dart';

import 'meta_data.dart';

class ProductResponseDto {
  final int? results;
  final Metadata? metadata;
  final List<Product>? data;

  ProductResponseDto({this.results, this.metadata, this.data});
}
