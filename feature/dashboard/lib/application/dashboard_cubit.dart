import 'package:core/cache/constants/cache_keys.dart';
import 'package:core/cache/shared/shared_manager.dart';
import 'package:dashboard/application/dashboard_state.dart';
import 'package:dashboard/application/dashboard_status.dart';
import 'package:dashboard/data/model/live_score_response_model.dart';
import 'package:dashboard/domain/entity/score_entity.dart';
import 'package:dashboard/domain/usecase/live_score_usecase.dart';
import 'package:dashboard/utils/dashboard_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit({required LiveScoreUsecase liveScore})
      : _liveScore = liveScore,
        super(DashboardState.initial());

  final LiveScoreUsecase _liveScore;
  TextEditingController searchController = TextEditingController();

  Future<void> init() async {
    emit(state.copyWith(status: DashboardStatus.loading));
    await getFavoriteScores();
    await fetchLiveScore();
    emit(state.copyWith(filteredScores: state.liveScores));
  }

  Future<void> fetchLiveScore() async {
    final result = await _liveScore.call();
    result.fold((error) {
      emit(state.copyWith(exception: error, status: DashboardStatus.error));
    }, (response) {
      emit(state.copyWith(
        liveScores: response.match,
        status: DashboardStatus.success,
      ));
    });
  }

  Future<void> triggerLiveScore() async {
    fetchLiveScore();
    getFavoriteScores();
  }

  Future<void> getFavoriteScores() async {
    LiveScoreResponseModel? favoriteScores = await SharedManager.instance!.getJsonModel(
      key: CacheKeys.favoriteScores.name,
      fromJson: (json) => LiveScoreResponseModel.fromJson(json),
    );
    emit(state.copyWith(favoriteScores: favoriteScores?.match));
  }

  Future<void> addFavoriteScore(ScoreEntity score) async {
    List<ScoreEntity> favoriteScores = state.favoriteScores ?? [];
    favoriteScores.add(score);
    emit(state.copyWith(favoriteScores: favoriteScores));
    LiveScoreResponseModel favoriteScoresModel = LiveScoreResponseModel(
      favoriteScores.map((e) => e.toModel()).toList(),
    );
    SharedManager.instance!.setJsonModel(
      key: CacheKeys.favoriteScores.name,
      model: favoriteScoresModel,
      duration: const Duration(days: 365),
    );
  }

  Future<void> removeFavoriteScore(ScoreEntity score) async {
    List<ScoreEntity> favoriteScores = state.favoriteScores ?? [];
    favoriteScores.removeWhere((element) => element.id == score.id);
    emit(state.copyWith(favoriteScores: favoriteScores));
    LiveScoreResponseModel favoriteScoresModel =
        LiveScoreResponseModel(favoriteScores.map((e) => e.toModel()).toList());
    SharedManager.instance!.setJsonModel(
      key: CacheKeys.favoriteScores.name,
      model: favoriteScoresModel,
      duration: const Duration(days: 365),
    );
  }

  Future<void> toggleFavoriteScore(ScoreEntity score) async {
    if (state.favoriteScores?.where((element) => element.id == score.id).isNotEmpty ?? false) {
      removeFavoriteScore(score);
    } else {
      addFavoriteScore(score);
    }
  }

  void setIndex(int index) {
    emit(state.copyWith(index: index));
    clearTotal();
  }

  Future<void> handleCoupon(ScoreEntity score, int coupon) async {
    Map<ScoreEntity, int> couponMap = Map.from(state.couponMap); // Create a new map
    if (couponMap[score] == coupon) {
      couponMap.remove(score);
    } else {
      couponMap[score] = coupon;
    }
    emit(state.copyWith(couponMap: couponMap));
  }

  double calculateOdds() {
    double totalOdds = 1;
    state.couponMap.forEach((score, coupon) {
      if (coupon == 1) {
        if (score.status == "IN PLAY") {
          totalOdds *= score.odds?.live?.one ?? 1;
        } else {
          totalOdds *= score.odds?.pre?.one ?? 1;
        }
      } else if (coupon == 0) {
        if (score.status == "IN PLAY") {
          totalOdds *= score.odds?.live?.x ?? 1;
        } else {
          totalOdds *= score.odds?.pre?.x ?? 1;
        }
      } else if (coupon == 2) {
        if (score.status == "IN PLAY") {
          totalOdds *= score.odds?.live?.two ?? 1;
        } else {
          totalOdds *= score.odds?.pre?.two ?? 1;
        }
      }
    });
    return totalOdds;
  }

  void calculateTotal({required String value}) {
    double odds = calculateOdds();
    double entry = double.tryParse(value) ?? 0;
    double total = entry * odds;
    emit(state.copyWith(total: total));
  }

  clearTotal() {
    emit(state.copyWith(total: 0));
  }

  void searchScore(String value) {
    if (state.index == DashboardPages.iddia.value) {
      List<ScoreEntity> liveScores = state.liveScores ?? [];
      liveScores = liveScores
          .where((element) =>
              (element.home_name ?? "").toLowerCase().contains(value.toLowerCase()) ||
              (element.away_name ?? "").toLowerCase().contains(value.toLowerCase()))
          .toList();
      emit(state.copyWith(filteredScores: liveScores));
    } else if (state.index == DashboardPages.favoriler.value) {
      List<ScoreEntity> favoriteScores = state.favoriteScores ?? [];
      favoriteScores.where((element) => element.location!.contains(value));
      emit(state.copyWith(filteredScores: favoriteScores));
    } else {
      List<ScoreEntity> couponScores = state.couponMap.keys.toList();
      couponScores.where((element) => element.location!.contains(value));
      emit(state.copyWith(filteredScores: couponScores));
    }
  }

  clearSearch() {
    searchController.clear();
    emit(state.copyWith(filteredScores: state.liveScores));
  }

  void filterLiveScores() {
    List<ScoreEntity> liveScores = state.liveScores ?? [];
    liveScores = liveScores.where((element) => element.status == "IN PLAY").toList();
    emit(state.copyWith(filteredScores: liveScores));
  }

  void filterAllScores() {
    emit(state.copyWith(filteredScores: state.liveScores));
  }

  void sortScoresByDesc() {
    List<ScoreEntity> scores = state.filteredScores ?? [];
    scores.sort((a, b) => b.added!.compareTo(a.added!));
    emit(state.copyWith(filteredScores: scores));
  }

  void sortScoresByAsc() {
    List<ScoreEntity> scores = state.filteredScores ?? [];
    scores.sort((a, b) => a.added!.compareTo(b.added!));
    emit(state.copyWith(filteredScores: scores));
  }

  void clearFilter() {
    emit(state.copyWith(filteredScores: state.liveScores));
  }

  void showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Filtrele'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CheckboxListTile(
              title: const Text('Canlı Maçlar'),
              value: false,
              onChanged: (value) {
                filterLiveScores();
                Navigator.pop(context);
              },
            ),
            CheckboxListTile(
              title: const Text('Hepsi'),
              value: false,
              onChanged: (value) {
                filterAllScores();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void showSortDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sırala'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('Tarihe Göre (Yeniden Eskiye)'),
              onTap: () {
                sortScoresByDesc();
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Tarihe Göre (Eskiden Yeniye)'),
              onTap: () {
                sortScoresByAsc();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void clearException() {
    emit(state.copyWith(exception: null));
  }
}
