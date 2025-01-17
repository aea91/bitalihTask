// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LiveEntity _$LiveEntityFromJson(Map<String, dynamic> json) => LiveEntity(
      one: (json['1'] as num?)?.toDouble(),
      two: (json['2'] as num?)?.toDouble(),
      x: (json['X'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$LiveEntityToJson(LiveEntity instance) =>
    <String, dynamic>{
      '1': instance.one,
      '2': instance.two,
      'X': instance.x,
    };
