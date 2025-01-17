// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'odds_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OddsEntity _$OddsEntityFromJson(Map<String, dynamic> json) => OddsEntity(
      pre: json['pre'] == null
          ? null
          : PreEntity.fromJson(json['pre'] as Map<String, dynamic>),
      live: json['live'] == null
          ? null
          : LiveEntity.fromJson(json['live'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OddsEntityToJson(OddsEntity instance) =>
    <String, dynamic>{
      'pre': instance.pre,
      'live': instance.live,
    };
