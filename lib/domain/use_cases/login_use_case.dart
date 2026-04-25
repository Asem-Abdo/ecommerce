import 'package:ecommerce/domain/entities/request/login_request.dart';
import 'package:ecommerce/domain/entities/response/auth_response.dart';
import 'package:ecommerce/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase {
  AuthRepository authRepository;
  LoginUseCase({required this.authRepository});

  Future<AuthResponse> invoke(LoginRequest loginRequest) {
    return authRepository.login(loginRequest);
  }
}
