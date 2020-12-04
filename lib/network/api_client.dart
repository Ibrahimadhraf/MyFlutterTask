import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:task/models/organization_model.dart' as organizations;
import 'package:task/models/repos_model.dart' as repos;
import 'api_constant.dart';
import 'error_response.dart';
enum RequestType {
 GETORGANIZATION,
  Repos,
}
Future<dynamic> getCallService(
    String url, RequestType requestType) async {
  logD('get url $url');
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      try {
        http.Response response = await http.get(url, headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        }).timeout(const Duration(seconds: 180));
        final statusCode = response.statusCode;
        logD('statusCode $statusCode');
        logD('response ${response.body}');
        if (statusCode != 200) {
          logD('error response ${response.body}');
          if (statusCode > 500 && statusCode < 599) {
            throw ErrorResponse(
                message: CODE_2, error: "statusCode:" + statusCode.toString());
          } else if (statusCode == 401) {
            var errorResponse = errorResponseFromJson(response.body);
            throw ErrorResponse(
                code: CODE_401,
                key: errorResponse.key,
                message: errorResponse.message,
                error: errorResponse.error);
          } else {
            var errorResponse = errorResponseFromJson(response.body);
            print('######## error is $errorResponse');
            throw ErrorResponse(
                code: errorResponse.code,
                key: errorResponse.key,
                message: errorResponse.message,
                error: errorResponse.error);
          }
        }
        switch (requestType) {
          case RequestType.GETORGANIZATION:
         return organizations.successResponseAllOrganizationModel(response.body);
          case RequestType.Repos:
            return repos.successResponseAllReposModel(response.body);
          default:
            {}
        }
      } on NoSuchMethodError catch (e) {
        logD('error here $e');
        throw ErrorResponse(
            message: CODE_2, error: e.toString() + " NoSuchMethodError");
      } on SocketException catch (e) {
        logD('error here $e');
        throw ErrorResponse(
            message: CODE_2, error: e.message + " SocketException");
      } on TimeoutException catch (e) {
        logD('error here $e');
        throw ErrorResponse(
            message: CODE_2, error: e.message + " TimeoutException");
      } on HandshakeException catch (e) {
        logD('error here $e');
        throw ErrorResponse(
            message: CODE_2, error: e.message + " HandshakeException");
      } on TypeError catch (e) {
        logD('error here $e');
        throw ErrorResponse(
            message: CODE_2, error: '${e.toString()} TypeError');
      } on FormatException catch (e) {
        logD('error here $e');
        throw ErrorResponse(
            message: CODE_2, error: e.message + "formatException");
      }
    }
  } on SocketException catch (_) {
    throw ErrorResponse(message: CODE_1);
  }
}