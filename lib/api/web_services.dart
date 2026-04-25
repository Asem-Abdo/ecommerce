import 'package:dio/dio.dart';
import 'package:ecommerce/api/api_endpoints.dart';
import 'package:ecommerce/api/model/request/login_request.dart';
import 'package:ecommerce/api/model/request/register_request.dart';
import 'package:ecommerce/api/model/response/auth_response.dart';
import 'package:retrofit/retrofit.dart';

part 'web_services.g.dart';

@RestApi()
abstract class WebServices {
  factory WebServices(Dio dio, {String? baseUrl}) = _WebServices;

  @POST(ApiEndpoints.loginApi)
  Future<AuthResponse> login(@Body() LoginRequest loginRequest);

  @POST(ApiEndpoints.registerApi)
  Future<AuthResponse> register(@Body() RegisterRequest registerRequest);
}
