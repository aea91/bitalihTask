import 'package:dashboard/data/model/live_score_response_model.dart';

abstract class DashboardDataSource {
  Future<LiveScoreResponseModel> fetchLiveScores();
}
