import 'package:json_annotation/json_annotation.dart';
part 'base_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class BaseResponseModel {
  BaseResponseModel({
    this.data,
    this.success,
    this.error,
    this.code,
  });

  dynamic data;
  bool? success;
  String? error;
  int? code;

  factory BaseResponseModel.fromJson(Map<String, dynamic> json) {
    return _$BaseResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$BaseResponseModelToJson(this);
  }
}
