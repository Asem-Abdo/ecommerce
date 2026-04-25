import 'package:ecommerce/domain/entities/request/login_request_dto.dart';
import 'package:ecommerce/domain/entities/request/register_request_dto.dart';
import 'package:ecommerce/domain/entities/response/auth_response_dto.dart';
import 'package:ecommerce/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterUseCase {
  AuthRepository authRepository;
  RegisterUseCase({required this.authRepository});

  Future<AuthResponseDto> invoke(RegisterRequestDto registerRequest) {
    return authRepository.register(registerRequest);
  }
}
