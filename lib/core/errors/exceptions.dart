import 'package:anime/models/api_response_model.dart';

abstract class CustomException implements Exception {
  final String message;
  final ApiResponseModel? response;

  const CustomException({required this.message, this.response});
}

class ServerException extends CustomException {
  ServerException({required super.message, super.response});
}

class SocketException extends CustomException {
  SocketException({required super.message, super.response});
}

class NoInternetException extends CustomException {
  NoInternetException({required super.message, super.response});
}

class UnauthorizedExeption extends CustomException {
  UnauthorizedExeption({required super.message, super.response});
}

class ForbiddenExeption extends CustomException {
  ForbiddenExeption({required super.message, super.response});
}

class BadRequestExeption extends CustomException {
  BadRequestExeption({required super.message, super.response});
}
