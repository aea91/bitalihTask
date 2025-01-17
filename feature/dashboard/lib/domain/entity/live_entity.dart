import 'package:json_annotation/json_annotation.dart';

part 'live_entity.g.dart';

@JsonSerializable()
class LiveEntity {
  @JsonKey(name: '1')
  final double? one;

  @JsonKey(name: '2')
  final double? two;

  @JsonKey(name: 'X')
  final double? x;

  const LiveEntity({
    this.one,
    this.two,
    this.x,
  });

  factory LiveEntity.fromJson(Map<String, dynamic> json) => _$LiveEntityFromJson(json);
  Map<String, dynamic> toJson() => _$LiveEntityToJson(this);

  @override
  String toString() => 'LiveEntity(one: $one, two: $two, x: $x)';
}
