import 'package:equatable/equatable.dart';

abstract class AppError extends Equatable {
  final String message;
  const AppError({required this.message});
}

class ErrorMessage extends AppError {
  const ErrorMessage({required super.message});

  @override
  List<Object?> get props => [message];
}
