import 'package:core/extensions/context_extensions.dart';
import 'package:dashboard/domain/entity/score_entity.dart';
import 'package:flutter/material.dart';

class ScoreHeader extends StatelessWidget {
  const ScoreHeader({
    super.key,
    required this.score,
  });

  final ScoreEntity score;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: ListTile(
        title: Text(
          score.location ?? "",
          style: context.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
