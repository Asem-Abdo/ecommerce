import 'package:ecommerce/api/mapper/sub_category_mapper.dart';
import 'package:ecommerce/api/model/response/products/product_dto.dart';
import 'package:ecommerce/domain/entities/response/product.dart';

extension ProductMapper on ProductDto {
  Product toProduct() {
    return Product(
      title: title,
      id: id,
      brand: brand,
      category: category,
      createdAt: createdAt,
      description: description,
      imageCover: imageCover,
      images: images,
      price: price,
      quantity: quantity,
      ratingsAverage: ratingsAverage,
      ratingsQuantity: ratingsQuantity,
      slug: slug,
      sold: sold,
      updatedAt: updatedAt,
      subCategory: subCategory?.map((e) => e.toSubCategory()).toList(),
    );
  }
}
