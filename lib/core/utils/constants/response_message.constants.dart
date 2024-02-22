import 'package:starring_u/core/utils/constants/resources/app_strings.manager.constants.dart';

class ResponseMessage {
  static const String success = AppStrings.success; // success with data
  static const String noContent =
      AppStrings.success; // success with no data (no content)
  static const String badRequest =
      AppStrings.strBadRequestError; // failure, API rejected request
  static const String unauthorized =
      AppStrings.strUnauthorizedError; // failure, user is not authorized
  static const String forbidden =
      AppStrings.strForbiddenError; //  failure, API rejected request
  static const String internalServerError =
      AppStrings.strInternalServerError; // failure, crash in server side
  static const String notFound =
      AppStrings.strNotFoundError; // failure, not found

  // local status code
  static const String connectTimeout = AppStrings.strTimeoutError;
  static const String cancel = AppStrings.strCacheError;
  static const String receiveTimeout = AppStrings.strTimeoutError;
  static const String sendTimeout = AppStrings.strTimeoutError;
  static const String cacheError = AppStrings.strCacheError;
  static const String noInternetConnection = AppStrings.strNoInternetError;
  static const String undefined =
      AppStrings.strUndefinedError; 
}
