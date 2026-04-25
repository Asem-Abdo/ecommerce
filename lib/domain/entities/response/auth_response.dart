import 'package:ecommerce/domain/entities/response/user_d.dart';

class AuthResponseD {
  final UserD? userDto;
  final String? token;

  AuthResponseD({required this.userDto, required this.token});
}
