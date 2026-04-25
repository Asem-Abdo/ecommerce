import '../../domain/entities/request/login_request_dto.dart';
import '../model/request/login_request.dart';

extension LoginRequestMapper on LoginRequestDto {
  LoginRequest toLoginRequest() {
    return LoginRequest(password: password, email: email);
  }
}
