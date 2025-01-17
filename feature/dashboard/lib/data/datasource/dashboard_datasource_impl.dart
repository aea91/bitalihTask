import 'package:core/base/model/network_error.dart';
import 'package:core/network/interface_network_manager.dart';
import 'package:dashboard/data/datasource/dashboard_datasource.dart';
import 'package:dashboard/data/model/live_score_response_model.dart';
import 'package:dashboard/utils/network_constants.dart';

class DashboardDataSourceImpl extends DashboardDataSource {
  DashboardDataSourceImpl(this.manager);

  final InterfaceNetworkManager manager;

  @override
  Future<LiveScoreResponseModel> fetchLiveScores() async {
    final response = await manager.dioGet(
      path: NetworkConstants.liveScore,
      fromJson: LiveScoreResponseModel.fromJson,
    );

    if (response is NetworkException) {
      throw response;
    }

    return response;
  }
}
