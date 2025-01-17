import 'package:dashboard/domain/entity/live_entity.dart';
import 'package:dashboard/domain/entity/pre_entitty.dart';
import 'package:json_annotation/json_annotation.dart';

part 'odds_entity.g.dart';

@JsonSerializable()
class OddsEntity {
  final PreEntity? pre;
  final LiveEntity? live;

  const OddsEntity({
    this.pre,
    this.live,
  });

  factory OddsEntity.fromJson(Map<String, dynamic> json) => _$OddsEntityFromJson(json);
  Map<String, dynamic> toJson() => _$OddsEntityToJson(this);

  @override
  String toString() => 'OddsEntity(pre: $pre, live: $live)';
}
