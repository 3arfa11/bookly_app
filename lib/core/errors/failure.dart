import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  const Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Timeout with Api server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Timeout with Api server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Timeout with Api server');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad Certificate');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request Cancelled');
      case DioExceptionType.connectionError:
        return ServerFailure('Connection Error');
      default:
        return ServerFailure('Unknown Error');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('404 Request Not Found');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server Error, Please try again later');
    } else {
      return ServerFailure('Unknown Error');
    }
  }
}
