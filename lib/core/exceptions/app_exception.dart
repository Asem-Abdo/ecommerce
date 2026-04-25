abstract class AppException implements Exception {
  final String message;
  int? statusCode;

  AppException({required this.message, this.statusCode});

  @override
  String toString() => message;
}

class ServerException extends AppException {
  ServerException({required super.message, super.statusCode});
}

class NetworkException extends AppException {
  NetworkException({required super.message, super.statusCode});
}

class UnknownException extends AppException {
  UnknownException({required super.message, super.statusCode});
}
