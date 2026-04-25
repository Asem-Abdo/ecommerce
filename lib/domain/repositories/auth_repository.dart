import 'package:ecommerce/domain/entities/request/login_request_dto.dart';
import 'package:ecommerce/domain/entities/request/register_request_dto.dart';
import 'package:ecommerce/domain/entities/response/auth_response_dto.dart';

abstract class AuthRepository {
  Future<AuthResponseDto> login(LoginRequestDto loginRequest);
  Future<AuthResponseDto> register(RegisterRequestDto registerRequest);
}
