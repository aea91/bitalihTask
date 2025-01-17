import 'package:core/base/model/network_error.dart';
import 'package:core/typedef/network_typedef.dart';
import 'package:dashboard/data/datasource/dashboard_datasource.dart';
import 'package:dashboard/data/model/live_score_response_model.dart';
import 'package:dashboard/domain/repository/dashboard_repository.dart';
import 'package:fpdart/fpdart.dart';

class DashboardRepositoryImpl extends DashboardRepository {
  DashboardRepositoryImpl(this.dataSource);

  final DashboardDataSource dataSource;

  @override
  ResultFuture<LiveScoreResponseModel> fetchLiveScores() async {
    try {
      final response = await dataSource.fetchLiveScores();
      return Right(response);
    } on NetworkException catch (e) {
      return Left(e);
    }
  }
}
