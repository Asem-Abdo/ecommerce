import 'package:ecommerce/api/mapper/auth_response_mapper.dart';
import 'package:ecommerce/api/mapper/register_request_mapper.dart';
import 'package:ecommerce/api/web_services.dart';
import 'package:ecommerce/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:ecommerce/domain/entities/request/login_request_dto.dart';
import 'package:ecommerce/domain/entities/request/register_request_dto.dart';
import 'package:ecommerce/domain/entities/response/auth_response_dto.dart';
import 'package:injectable/injectable.dart';

import '../../mapper/login_request_mapper.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImp implements AuthRemoteDataSource {
  WebServices webServices;
  AuthRemoteDataSourceImp({required this.webServices});

  @override
  Future<AuthResponseDto> login(LoginRequestDto loginRequest) async {
    /// LoginRequestDto  => to => LoginRequest
    var authResponse = await webServices.login(loginRequest.toLoginRequest());

    /// AuthResponse => to => AuthResponseDto
    return authResponse.toAuthResponseDto();
  }

  @override
  Future<AuthResponseDto> register(RegisterRequestDto registerRequest) async {
    /// todo :RegisterRequestDto => to => RegisterRequest
    var authResponse = await webServices.register(
      registerRequest.toRegisterRequest(),
    );

    /// todo : AuthResponse => to => AuthResponseDto
    return authResponse.toAuthResponseDto();
  }
}
