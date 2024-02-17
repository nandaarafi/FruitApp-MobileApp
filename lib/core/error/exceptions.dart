import 'package:equatable/equatable.dart';

class FetchDataException extends Equatable implements Exception {
  const FetchDataException({required this.message});

  final String message;

  @override
  List<dynamic> get props => [message];
}
class InvalidRequestException implements Exception {
  final String message;

  InvalidRequestException(this.message);

  @override
  String toString() {
    return 'InvalidRequestException: $message';
  }
}

class UnauthorisedException implements Exception {
  final String message;

  UnauthorisedException(this.message);

  @override
  String toString() {
    return 'UnauthorisedException: $message';
  }
}

