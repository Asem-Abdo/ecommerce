import 'package:ecommerce/core/exceptions/app_exception.dart';
import 'package:ecommerce/domain/entities/request/register_request_dto.dart';
import 'package:ecommerce/domain/use_cases/register_use_case.dart';
import 'package:ecommerce/features/ui/auth/states/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterViewModel extends Cubit<AuthStates> {
  RegisterUseCase registerUseCase;
  RegisterViewModel({required this.registerUseCase})
    : super(AuthInitialState());

  /// view model => hold data - handel logic

  final formKey = GlobalKey<FormState>();
  void register({
    required String email,
    required String password,
    required phone,
    required name,
    required rePassword,
  }) async {
    if (formKey.currentState?.validate() == true) {
      /// todo : login logic
      try {
        emit(AuthLoadingState());
        var registerRequest = RegisterRequestDto(
          name: name,
          email: email,
          password: password,
          rePassword: rePassword,
          phone: phone,
        );
        var response = await registerUseCase.invoke(registerRequest);
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
