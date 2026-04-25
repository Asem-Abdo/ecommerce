import 'package:ecommerce/domain/entities/response/user_dto.dart';

class AuthResponseDto {
  final UserDto? userDto;
  final String? token;

  AuthResponseDto({required this.userDto, required this.token});
}
