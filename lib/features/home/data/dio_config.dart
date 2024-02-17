import 'package:dio/dio.dart';

final dio = Dio(BaseOptions(
  baseUrl: 'https://65bf3116dcfcce42a6f3459e.mockapi.io/test-api/',
  connectTimeout: Duration.zero,
  receiveTimeout: Duration.zero,
  // headers: {'Authorization': 'Bearer 123456'},
  // contentType: 'application/json',
));