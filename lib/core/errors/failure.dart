import 'package:anime/models/api_response_model.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  final ApiResponseModel? response;

  const Failure(this.message, this.response, [List properties = const <dynamic>[]]);

  @override
  List<Object> get props => [];
}

class ApiFailure extends Failure {
  const ApiFailure(super.message, super.response);
}

class UnknowFailure extends Failure {
  const UnknowFailure(super.message, super.response);
}
