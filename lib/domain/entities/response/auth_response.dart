import 'package:ecommerce/domain/entities/response/user.dart';

class AuthResponse {
  final User? userDto;
  final String? token;

  AuthResponse({required this.userDto, required this.token});
}
