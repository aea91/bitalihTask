// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outcomes_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OutcomesEntity _$OutcomesEntityFromJson(Map<String, dynamic> json) =>
    OutcomesEntity(
      one: (json['1'] as num?)?.toDouble(),
      two: (json['2'] as num?)?.toDouble(),
      x: (json['X'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$OutcomesEntityToJson(OutcomesEntity instance) =>
    <String, dynamic>{
      '1': instance.one,
      '2': instance.two,
      'X': instance.x,
    };
