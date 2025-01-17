// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_score_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LiveScoreResponseModel _$LiveScoreResponseModelFromJson(
        Map<String, dynamic> json) =>
    LiveScoreResponseModel(
      (json['match'] as List<dynamic>)
          .map((e) => ScoreModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LiveScoreResponseModelToJson(
        LiveScoreResponseModel instance) =>
    <String, dynamic>{
      'match': instance.match,
    };
