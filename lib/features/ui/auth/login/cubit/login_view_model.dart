import 'package:ecommerce/core/exceptions/app_exception.dart';
import 'package:ecommerce/domain/entities/request/login_request_dto.dart';
import 'package:ecommerce/domain/use_cases/login_use_case.dart';
import 'package:ecommerce/features/ui/auth/states/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel extends Cubit<AuthStates> {
  LoginUseCase loginUseCase;
  LoginViewModel({required this.loginUseCase}) : super(AuthInitialState());

  /// view model => hold data - handel logic

  final formKey = GlobalKey<FormState>();
  void login({required String email, required String password}) async {
    if (formKey.currentState?.validate() == true) {
      /// todo : login logic
      try {
        emit(AuthLoadingState());
        var loginRequest = LoginRequestDto(email: email, password: password);
        var response = await loginUseCase.invoke(loginRequest);
        emit(AuthSuccessState(authResponse: response));
      } on AppException catch (e) {
        emit(AuthErrorState(message: e.message));
      } on DioException catch (e) {
        final message = (e.error is AppException)
            ? (e.error as AppException).message
            : "Unknown Error";
        emit(AuthErrorState(message: message));
      }
    }
  }
}
