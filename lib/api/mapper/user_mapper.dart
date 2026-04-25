import 'package:ecommerce/api/model/response/user.dart';
import 'package:ecommerce/domain/entities/response/user_dto.dart';

extension UserMapper on User {
  UserDto toUserDto() {
    return UserDto(name: name, email: email);
  }
}
