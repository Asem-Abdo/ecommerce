import 'package:ecommerce/api/model/request/register_request.dart';
import 'package:ecommerce/domain/entities/request/register_request_dto.dart';

extension RegisterRequestMapper on RegisterRequestDto {
  RegisterRequest toRegisterRequest() {
    return RegisterRequest(
      email: email,
      password: password,
      name: name,
      phone: phone,
      rePassword: rePassword,
    );
  }
}
