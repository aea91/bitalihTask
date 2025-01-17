// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'score_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScoreEntity _$ScoreEntityFromJson(Map<String, dynamic> json) => ScoreEntity(
      location: json['location'] as String?,
      scheduled: json['scheduled'] as String?,
      country: json['country'] == null
          ? null
          : CountryEntity.fromJson(json['country'] as Map<String, dynamic>),
      competition_id: (json['competition_id'] as num?)?.toInt(),
      last_changed: json['last_changed'] as String?,
      league_id: (json['league_id'] as num?)?.toInt(),
      away_name: json['away_name'] as String?,
      events: json['events'] as String?,
      ps_score: json['ps_score'] as String?,
      status: json['status'] as String?,
      competition_name: json['competition_name'] as String?,
      h2h: json['h2h'] as String?,
      fixture_id: (json['fixture_id'] as num?)?.toInt(),
      has_lineups: json['has_lineups'] as bool?,
      away_id: (json['away_id'] as num?)?.toInt(),
      score: json['score'] as String?,
      home_id: (json['home_id'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
      home_name: json['home_name'] as String?,
      odds: json['odds'] == null ? null : OddsEntity.fromJson(json['odds'] as Map<String, dynamic>),
      league_name: json['league_name'] as String?,
      time: json['time'] as String?,
      et_score: json['et_score'] as String?,
      added: json['added'] as String?,
      ht_score: json['ht_score'] as String?,
      ft_score: json['ft_score'] as String?,
      outcomes: json['outcomes'] == null
          ? null
          : OutcomesEntity.fromJson(json['outcomes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ScoreEntityToJson(ScoreEntity instance) => <String, dynamic>{
      'location': instance.location,
      'scheduled': instance.scheduled,
      'country': instance.country,
      'competition_id': instance.competition_id,
      'last_changed': instance.last_changed,
      'league_id': instance.league_id,
      'away_name': instance.away_name,
      'events': instance.events,
      'ps_score': instance.ps_score,
      'status': instance.status,
      'competition_name': instance.competition_name,
      'h2h': instance.h2h,
      'fixture_id': instance.fixture_id,
      'has_lineups': instance.has_lineups,
      'away_id': instance.away_id,
      'score': instance.score,
      'home_id': instance.home_id,
      'id': instance.id,
      'home_name': instance.home_name,
      'odds': instance.odds,
      'league_name': instance.league_name,
      'time': instance.time,
      'et_score': instance.et_score,
      'added': instance.added,
      'ht_score': instance.ht_score,
      'ft_score': instance.ft_score,
      'outcomes': instance.outcomes,
    };
