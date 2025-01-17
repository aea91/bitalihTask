// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:core/exception/app_exception.dart';
import 'package:dashboard/application/dashboard_status.dart';
import 'package:dashboard/domain/entity/score_entity.dart';
import 'package:equatable/equatable.dart';

class DashboardState extends Equatable {
  const DashboardState({
    required this.status,
    required this.exception,
    required this.liveScores,
    required this.favoriteScores,
    required this.index,
    required this.couponMap,
    required this.totalOdds,
    required this.total,
    required this.filteredScores,
  });

  final DashboardStatus status;
  final AppException? exception;
  final List<ScoreEntity>? liveScores;
  final List<ScoreEntity>? favoriteScores;
  final List<ScoreEntity>? filteredScores;
  final Map<ScoreEntity, int> couponMap;
  final int index;
  final double totalOdds;
  final double total;

  factory DashboardState.initial() => const DashboardState(
        status: DashboardStatus.initial,
        exception: null,
        liveScores: null,
        favoriteScores: null,
        couponMap: {},
        index: 0,
        totalOdds: 0,
        total: 0,
        filteredScores: null,
      );

  @override
  List<Object?> get props => [
        status,
        exception,
        liveScores,
        favoriteScores,
        index,
        couponMap,
        totalOdds,
        total,
        filteredScores
      ];

  DashboardState copyWith({
    DashboardStatus? status,
    AppException? exception,
    List<ScoreEntity>? liveScores,
    List<ScoreEntity>? favoriteScores,
    int? index,
    Map<ScoreEntity, int>? couponMap,
    double? totalOdds,
    double? total,
    List<ScoreEntity>? filteredScores,
  }) {
    return DashboardState(
      status: status ?? this.status,
      exception: exception ?? this.exception,
      liveScores: liveScores ?? this.liveScores,
      favoriteScores: favoriteScores ?? this.favoriteScores,
      index: index ?? this.index,
      couponMap: couponMap ?? this.couponMap,
      totalOdds: totalOdds ?? this.totalOdds,
      total: total ?? this.total,
      filteredScores: filteredScores ?? this.filteredScores,
    );
  }
}
