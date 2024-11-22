part of '../../network.dart';

base class ApiException implements Exception {
  final String? message;

  const ApiException({this.message = "Something went wrong"});
}

base class UnAuthenticated extends ApiException {
  const UnAuthenticated({super.message});
}

base class TimeoutException extends ApiException {
  const TimeoutException({super.message});
}
base class DefaultException extends ApiException {
  const DefaultException({super.message});
}

base class InternetConnectionException extends ApiException {
  const InternetConnectionException({super.message});
}