import 'package:core/extensions/context_extensions.dart';
import 'package:dashboard/domain/entity/score_entity.dart';
import 'package:flutter/material.dart';

class ScoreField extends StatelessWidget {
  const ScoreField({
    super.key,
    required this.score,
  });

  final ScoreEntity score;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: context.paddingPage,
      title: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  score.home_name ?? "",
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.titleMedium,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  score.score ?? "",
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  score.away_name ?? "",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.end,
                  style: context.textTheme.titleMedium,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
