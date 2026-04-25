import 'package:ecommerce/api/mapper/user_mapper.dart';
import 'package:ecommerce/api/model/response/auth_response_dto.dart';
import 'package:ecommerce/core/exceptions/app_exception.dart';
import 'package:ecommerce/domain/entities/response/auth_response.dart';

extension AuthResponseMapper on AuthResponseDto {
  AuthResponse toAuthResponseDto() {
    if (user != null && token!.isNotEmpty && token != null) {
      return AuthResponse(userDto: user!.toUserD(), token: token);
    }
    throw ServerException(message: message ?? "Failed Authentication");
  }
}
