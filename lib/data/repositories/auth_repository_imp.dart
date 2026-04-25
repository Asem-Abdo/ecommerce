import 'package:ecommerce/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:ecommerce/domain/entities/request/login_request_dto.dart';
import 'package:ecommerce/domain/entities/request/register_request_dto.dart';
import 'package:ecommerce/domain/entities/response/auth_response_dto.dart';
import 'package:ecommerce/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImp implements AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImp({required this.authRemoteDataSource});

  @override
  Future<AuthResponseDto> login(LoginRequestDto loginRequest) {
    return authRemoteDataSource.login(loginRequest);
  }

  @override
  Future<AuthResponseDto> register(RegisterRequestDto registerRequest) {
    return authRemoteDataSource.register(registerRequest);
  }
}
