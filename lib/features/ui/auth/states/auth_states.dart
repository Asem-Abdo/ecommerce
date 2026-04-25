import 'package:ecommerce/domain/entities/response/auth_response.dart';

abstract class AuthStates {}

class AuthInitialState extends AuthStates {}

class AuthLoadingState extends AuthStates {}

class AuthErrorState extends AuthStates {
  String message;
  AuthErrorState({required this.message});
}

class AuthSuccessState extends AuthStates {
  AuthResponse authResponse;
  AuthSuccessState({required this.authResponse});
}
