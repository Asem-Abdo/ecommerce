import 'package:ecommerce/api/model/request/register_request_dto.dart';
import 'package:ecommerce/domain/entities/request/register_request.dart';

extension RegisterRequestMapper on RegisterRequest {
  RegisterRequestDto toRegisterRequest() {
    return RegisterRequestDto(
      email: email,
      password: password,
      name: name,
      phone: phone,
      rePassword: rePassword,
    );
  }
}
