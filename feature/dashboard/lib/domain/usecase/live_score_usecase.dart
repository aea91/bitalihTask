import 'package:dashboard/data/model/live_score_response_model.dart';
import 'package:dashboard/domain/repository/dashboard_repository.dart';
import 'package:core/typedef/network_typedef.dart';
import 'package:core/usecase/usecase.dart';

class LiveScoreUsecase extends UseCaseWithoutParams<LiveScoreResponseModel> {
  LiveScoreUsecase(this.repository);

  final DashboardRepository repository;

  @override
  ResultFuture<LiveScoreResponseModel> call() async => repository.fetchLiveScores();
}
