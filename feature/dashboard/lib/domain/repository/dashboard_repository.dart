import 'package:core/typedef/network_typedef.dart';
import 'package:dashboard/data/model/live_score_response_model.dart';

abstract class DashboardRepository {
  ResultFuture<LiveScoreResponseModel> fetchLiveScores();
}
