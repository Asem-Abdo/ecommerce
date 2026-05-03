import 'package:ecommerce/api/model/response/common/category_dto.dart';
import 'package:ecommerce/domain/entities/response/sub_category.dart';

class Product {
  final int? sold;
  final List<String>? images;
  final List<SubCategory>? subCategory;
  final int? ratingsQuantity;
  final String? title;
  final String? slug;
  final String? description;
  final int? quantity;
  final int? price;
  final String? imageCover;
  final CategoryDto? category;
  final CategoryDto? brand;
  final int? ratingsAverage;
  final String? createdAt;
  final String? updatedAt;
  final String? id;

  Product({
    this.sold,
    this.images,
    this.subCategory,
    this.ratingsQuantity,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
    this.id,
  });
}
