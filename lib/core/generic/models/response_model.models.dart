import 'package:freezed_annotation/freezed_annotation.dart';
part 'response_model.models.freezed.dart';

@freezed
class ResponseModel with _$ResponseModel {
  const ResponseModel._();
  factory ResponseModel({
    int? status,
    String? message,
    dynamic data,
  }) = _ResponseModel;
}
