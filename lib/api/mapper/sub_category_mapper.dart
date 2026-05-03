import 'package:ecommerce/api/model/response/common/category_dto.dart';
import 'package:ecommerce/api/model/response/products/product_dto.dart';
import 'package:ecommerce/api/model/response/products/sub_category_dto.dart';
import 'package:ecommerce/domain/entities/response/category.dart';
import 'package:ecommerce/domain/entities/response/product.dart';
import 'package:ecommerce/domain/entities/response/sub_category.dart';

extension SubCategoryMapper on SubCategoryDto {
  SubCategory toSubCategory() {
    return SubCategory(id: id, name: name, category: category, slug: slug);
  }
}
