import 'package:json_annotation/json_annotation.dart';

part 'pre_entitty.g.dart';

@JsonSerializable()
class PreEntity {
  @JsonKey(name: '1')
  final double? one;

  @JsonKey(name: '2')
  final double? two;

  @JsonKey(name: 'X')
  final double? x;

  const PreEntity({
    this.one,
    this.two,
    this.x,
  });

  factory PreEntity.fromJson(Map<String, dynamic> json) => _$PreEntityFromJson(json);
  Map<String, dynamic> toJson() => _$PreEntityToJson(this);

  @override
  String toString() => 'PreEntity(one: $one, two: $two, x: $x)';
}
