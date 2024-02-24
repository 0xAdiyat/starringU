import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:starring_u/clients/http.client.dart';

import '../core/utils/constants/k.constants.dart';

part 'api_service.g.dart';

@riverpod
ApiService apiService(
  ApiServiceRef ref,
) =>
    ApiService(ref.read(httpClientProvider(enableLogging: true)));

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<Response> get(
      {required String endPoint, dynamic data, dynamic params}) async {
    var response = await _dio.get('${KConstants.baseUrl}$endPoint',
        data: data, queryParameters: params);
    return response;
  }

  Future<Response> post(
      {required String endPoint, dynamic data, dynamic params}) async {
    var response = await _dio.post('${KConstants.baseUrl}$endPoint',
        data: data, queryParameters: params);
    return response;
  }

  Future<Response> put({required String endPoint}) async {
    var response = await _dio.put('${KConstants.baseUrl}$endPoint');
    return response;
  }

  Future<Response> delete({required String endPoint}) async {
    var response = await _dio.delete('${KConstants.baseUrl}$endPoint');
    return response;
  }
}
