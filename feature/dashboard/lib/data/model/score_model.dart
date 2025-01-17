import 'package:dashboard/domain/entity/country_entity.dart';
import 'package:dashboard/domain/entity/odds_entity.dart';
import 'package:dashboard/domain/entity/outcomes_entity.dart';
import 'package:dashboard/domain/entity/score_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'score_model.g.dart';

@JsonSerializable()
class ScoreModel extends ScoreEntity {
  const ScoreModel({
    required super.location,
    required super.scheduled,
    required super.country,
    required super.competition_id,
    required super.last_changed,
    required super.league_id,
    required super.away_name,
    required super.events,
    required super.ps_score,
    required super.status,
    required super.competition_name,
    required super.h2h,
    required super.fixture_id,
    required super.has_lineups,
    required super.away_id,
    required super.score,
    required super.home_id,
    required super.id,
    required super.home_name,
    required super.odds,
    required super.league_name,
    required super.time,
    required super.et_score,
    required super.added,
    required super.ht_score,
    required super.ft_score,
    required super.outcomes,
  });

  factory ScoreModel.fromJson(Map<String, dynamic> json) => _$ScoreModelFromJson(json);
  Map<String, dynamic> toJson() => _$ScoreModelToJson(this);

  ScoreEntity toEntity() => ScoreEntity(
        location: location,
        scheduled: scheduled,
        country: country,
        competition_id: competition_id,
        last_changed: last_changed,
        league_id: league_id,
        away_name: away_name,
        events: events,
        ps_score: ps_score,
        status: status,
        competition_name: competition_name,
        h2h: h2h,
        fixture_id: fixture_id,
        has_lineups: has_lineups,
        away_id: away_id,
        score: score,
        home_id: home_id,
        id: id,
        home_name: home_name,
        odds: odds,
        league_name: league_name,
        time: time,
        et_score: et_score,
        added: added,
        ht_score: ht_score,
        ft_score: ft_score,
        outcomes: outcomes,
      );
}
