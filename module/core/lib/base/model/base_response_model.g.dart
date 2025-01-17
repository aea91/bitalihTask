// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseModel _$BaseResponseModelFromJson(Map<String, dynamic> json) => BaseResponseModel(
      data: json['data'],
      success: json['success'] as bool?,
      error: json['error'] as String?,
      code: json['code'] as int?,
    );

Map<String, dynamic> _$BaseResponseModelToJson(BaseResponseModel instance) => <String, dynamic>{
      'data': instance.data,
      'success': instance.success,
      'error': instance.error,
      'code': instance.code,
    };
