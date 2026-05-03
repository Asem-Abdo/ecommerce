import 'package:ecommerce/api/model/response/common/category_dto.dart';
import 'package:ecommerce/domain/entities/response/category.dart';

extension CategoryMapper on CategoryDto {
  Category toCategory() {
    return Category(name: name, image: image, id: id);
  }
}
