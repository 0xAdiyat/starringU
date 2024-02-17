import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:starring_u/clients/talker.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';

part 'http.client.g.dart';

/// Base URL
const baseUrl = '';
const apiKey = String.fromEnvironment('GPT_API_KEY');

@riverpod
Dio httpClient(HttpClientRef ref, {bool enableLogging = true}) {
  final options =
      BaseOptions(baseUrl: baseUrl, queryParameters: {'key': apiKey});
  final client = Dio(options);
  ref.onDispose(client.close);

  if (enableLogging) client.interceptors.add(TalkerDioLogger(talker: talker));

  return client;
}
