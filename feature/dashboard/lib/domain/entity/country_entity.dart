import 'package:json_annotation/json_annotation.dart';

part 'country_entity.g.dart';

@JsonSerializable()
class CountryEntity {
  final int? id;
  final String? name;
  final String? flag;

  const CountryEntity({
    this.id,
    this.name,
    this.flag,
  });

  factory CountryEntity.fromJson(Map<String, dynamic> json) => _$CountryEntityFromJson(json);
  Map<String, dynamic> toJson() => _$CountryEntityToJson(this);

  @override
  String toString() => 'CountryEntity(id: $id, name: $name, flag: $flag)';
}
