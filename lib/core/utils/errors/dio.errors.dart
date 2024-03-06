import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:starring_u/core/generic/models/response_model.models.dart';
import 'package:starring_u/core/utils/extensions/data_source.ext.dart';

import '../../../clients/connectivity_check.provider.dart';
import '../../generic/models/failure.models.dart';
import '../enums/data_source.enum.dart';
import 'error_handler.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;

FutureEither<ResponseModel> getResponse(Response response,
    {required ConnectionCheck connectivity}) async {
  final hasInternet = await connectivity.checkFullConnectivity();

  if (hasInternet) {
    try {
      final formattedResponse =
          ResponseModel(status: response.statusCode, data: response.data);
      return right(formattedResponse);
    } catch (error) {
      return left(ErrorHandler.handle(error).failure);
    }
  } else {
    return left(DataSource.noInternetConnection.getFailure());
  }
}
