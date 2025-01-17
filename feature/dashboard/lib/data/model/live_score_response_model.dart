import 'package:dashboard/data/model/score_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'live_score_response_model.g.dart';

@JsonSerializable()
class LiveScoreResponseModel {
  LiveScoreResponseModel(this.match);

  final List<ScoreModel> match;

  factory LiveScoreResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LiveScoreResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LiveScoreResponseModelToJson(this);
}
