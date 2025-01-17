import 'package:json_annotation/json_annotation.dart';

part 'outcomes_entity.g.dart';

@JsonSerializable()
class OutcomesEntity {
  @JsonKey(name: '1')
  final double? one;

  @JsonKey(name: '2')
  final double? two;

  @JsonKey(name: 'X')
  final double? x;

  const OutcomesEntity({
    this.one,
    this.two,
    this.x,
  });

  factory OutcomesEntity.fromJson(Map<String, dynamic> json) => _$OutcomesEntityFromJson(json);
  Map<String, dynamic> toJson() => _$OutcomesEntityToJson(this);

  @override
  String toString() => 'OutcomesEntity(one: $one, two: $two, x: $x)';
}
