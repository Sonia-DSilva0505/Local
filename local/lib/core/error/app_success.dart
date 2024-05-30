import 'package:equatable/equatable.dart';

abstract class AppSuccess extends Equatable {
  final String message;
  const AppSuccess({required this.message});
}

class SuccessMessage extends AppSuccess {
  const SuccessMessage({required super.message});

  @override
  List<Object?> get props => [message];
}



abstract class AppSuccessWithResponse extends Equatable {
  final String message;
  final dynamic response;
  const AppSuccessWithResponse({required this.message, required this.response});
}

class SuccessMessageAndResponseBody extends AppSuccessWithResponse {
  const SuccessMessageAndResponseBody({required super.message, required super.response});

  @override
  List<Object?> get props => [message, response];
}
