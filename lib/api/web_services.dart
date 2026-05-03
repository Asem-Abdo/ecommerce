import 'package:dio/dio.dart';
import 'package:ecommerce/api/api_endpoints.dart';
import 'package:ecommerce/api/model/request/login_request_dto.dart';
import 'package:ecommerce/api/model/request/register_request_dto.dart';
import 'package:ecommerce/api/model/response/auth_response_dto.dart';
import 'package:ecommerce/api/model/response/brands/brand_response_dto.dart';
import 'package:ecommerce/api/model/response/category/category-response_dto.dart';
import 'package:ecommerce/api/model/response/products/product_response_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'web_services.g.dart';

@RestApi()
abstract class WebServices {
  factory WebServices(Dio dio, {String? baseUrl}) = _WebServices;

  @POST(ApiEndpoints.loginApi)
  Future<AuthResponseDto> login(@Body() LoginRequestDto loginRequest);

  @POST(ApiEndpoints.registerApi)
  Future<AuthResponseDto> register(@Body() RegisterRequestDto registerRequest);

  @GET(ApiEndpoints.categoriesApi)
  Future<CategoryResponseDto> getAllCategories();

  @GET(ApiEndpoints.brandsApi)
  Future<BrandResponseDto> getAllBrands();

  @GET(ApiEndpoints.productsApi)
  Future<ProductResponseDto> getAllProducts();
}
