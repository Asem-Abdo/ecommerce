import 'package:ecommerce/domain/entities/response/auth_response_dto.dart';

abstract class AuthStates {}

class AuthInitialState extends AuthStates {}

class AuthLoadingState extends AuthStates {}

class AuthErrorState extends AuthStates {
  String message;
  AuthErrorState({required this.message});
}

class AuthSuccessState extends AuthStates {
  AuthResponseDto authResponse;
  AuthSuccessState({required this.authResponse});
}
