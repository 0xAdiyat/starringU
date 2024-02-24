// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:starring_u/core/models/failure.models.dart';
// import 'package:starring_u/core/utils/errors/error_handler.errors.dart';
// import 'package:starring_u/core/utils/extensions/data_source.ext.dart';

// import '../enums/data_source.enum.dart';

// Future<Either<Failure, ResponseDto>> getResponse(RequestDto requestDto) async {
//   if (await _networkInfo.isConnected) {
//     try {
//       return Right(response);
//     } catch (error) {
//       return Left(ErrorHandler.handle(error).failure);
//     }
//   } else {
//     return Left(DataSource.noInternetConnection.getFailure());
//   }
// }
