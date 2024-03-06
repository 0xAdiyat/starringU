import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:starring_u/clients/talker.dart';
import 'package:starring_u/features/shared/data/json.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';

import '../core/utils/constants/k.constants.dart';

part 'http.client.g.dart';

@riverpod
Dio httpClient(HttpClientRef ref,
    {bool enableLogging = true, Json? queryParameters}) {
  Map<String, String> headers = {
    KConstants.contentType: KConstants.applicationJson,
    KConstants.accept: KConstants.applicationJson,
    KConstants.authorization: KConstants.token,
    KConstants.defaultLanguage: KConstants.defaultLanguage
  };
  final options = BaseOptions(
    baseUrl: KConstants.baseUrl,
    queryParameters: queryParameters ?? {'key': KConstants.apiKey},
    headers: headers,
    receiveTimeout: KConstants.apiTimeOut,
    sendTimeout: KConstants.apiTimeOut,
  );
  final client = Dio(options);
  ref.onDispose(client.close);

  if (enableLogging && !kReleaseMode) {
    client.interceptors.add(TalkerDioLogger(talker: talker));
  }
  return client;
}
