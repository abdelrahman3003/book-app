import 'package:dio/dio.dart';

abstract class Failure {
  final String Errormessage;

  Failure(this.Errormessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.Errormessage);
  factory ServerFailure.froDioError(DioError dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection timeout with ApiServer");
      case DioExceptionType.sendTimeout:
        return ServerFailure("Send timeout with ApiServer");
      case DioExceptionType.receiveTimeout:
        return ServerFailure("receive tmeout with ApiServer");
      case DioExceptionType.badCertificate:
        return ServerFailure("Bad Certificate");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure("Request to Api was canceled");
      case DioExceptionType.connectionError:
        return ServerFailure("Request to Api was canceled");
      case DioExceptionType.unknown:
        if (dioError.message!.contains("SocketException"))
          return ServerFailure("No internet connection");
        return ServerFailure("UnEcepected  Error, try later");
      default:
        return ServerFailure("opps, there was an Error ,please try again");
    }
  }
  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404)
      return ServerFailure(
          "Your request not found : Error 404, please try again");
    else if (statusCode == 500)
      return ServerFailure("Enternal server Error 500 , please try again");
    return ServerFailure("opps, there was an Error ,please try again");
  }
}
