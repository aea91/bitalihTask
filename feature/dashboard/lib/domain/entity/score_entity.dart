import 'package:dashboard/data/model/score_model.dart';
import 'package:dashboard/domain/entity/country_entity.dart';
import 'package:dashboard/domain/entity/odds_entity.dart';
import 'package:dashboard/domain/entity/outcomes_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'score_entity.g.dart';

@JsonSerializable()
class ScoreEntity extends Equatable {
  final String? location;
  final String? scheduled;
  final CountryEntity? country;
  final int? competition_id;
  final String? last_changed;
  final int? league_id;
  final String? away_name;
  final String? events;
  final String? ps_score;
  final String? status;
  final String? competition_name;
  final String? h2h;
  final int? fixture_id;
  final bool? has_lineups;
  final int? away_id;
  final String? score;
  final int? home_id;
  final int? id;
  final String? home_name;
  final OddsEntity? odds;
  final String? league_name;
  final String? time;
  final String? et_score;
  final String? added;
  final String? ht_score;
  final String? ft_score;
  final OutcomesEntity? outcomes;

  const ScoreEntity({
    required this.location,
    required this.scheduled,
    required this.country,
    required this.competition_id,
    required this.last_changed,
    required this.league_id,
    required this.away_name,
    required this.events,
    required this.ps_score,
    required this.status,
    required this.competition_name,
    required this.h2h,
    required this.fixture_id,
    required this.has_lineups,
    required this.away_id,
    required this.score,
    required this.home_id,
    required this.id,
    required this.home_name,
    required this.odds,
    required this.league_name,
    required this.time,
    required this.et_score,
    required this.added,
    required this.ht_score,
    required this.ft_score,
    required this.outcomes,
  });

  factory ScoreEntity.fromJson(Map<String, dynamic> json) => _$ScoreEntityFromJson(json);
  Map<String, dynamic> toJson() => _$ScoreEntityToJson(this);

  ScoreModel toModel() => ScoreModel(
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

  @override
  List<Object?> get props => [id];
}
