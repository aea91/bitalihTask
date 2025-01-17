import 'package:core/extensions/context_extensions.dart';
import 'package:dashboard/domain/entity/score_entity.dart';
import 'package:flutter/material.dart';

class OddsField extends StatelessWidget {
  const OddsField({
    super.key,
    required this.score,
    required this.onSelectedCoupon,
    required this.couponMap,
  });

  final ScoreEntity score;
  final Function(int) onSelectedCoupon;
  final Map<ScoreEntity, int> couponMap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingPage,
      child: Row(
        children: [
          _buildStatusColumn(context: context, title: "Status", status: score.status),
          _buildOddsColumn(
            onTap: () => onSelectedCoupon(1),
            context: context,
            title: "MS 1",
            isSelected: couponMap[score] == 1,
            odds: score.status == "IN PLAY"
                ? score.odds?.live?.one.toString()
                : score.odds?.pre?.one.toString(),
          ),
          _buildOddsColumn(
            onTap: () => onSelectedCoupon(0),
            context: context,
            title: "MS X",
            isSelected: couponMap[score] == 0,
            odds: score.status == "IN PLAY"
                ? score.odds?.live?.x.toString()
                : score.odds?.pre?.x.toString(),
          ),
          _buildOddsColumn(
            onTap: () => onSelectedCoupon(2),
            context: context,
            title: "MS 2",
            isSelected: couponMap[score] == 2,
            odds: score.status == "IN PLAY"
                ? score.odds?.live?.two.toString()
                : score.odds?.pre?.two.toString(),
          ),
        ],
      ),
    );
  }

  Widget _buildOddsColumn({
    required BuildContext context,
    required String title,
    required String? odds,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      flex: 30,
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Text(
              title,
              style: context.textTheme.bodyMedium?.copyWith(
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: isSelected ? Colors.amber : Colors.green,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                odds ?? "",
                style: context.textTheme.titleSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusColumn({
    required BuildContext context,
    required String title,
    required String? status,
  }) {
    return Expanded(
      flex: 30,
      child: Column(
        children: [
          Text(
            title,
            style: context.textTheme.bodyMedium?.copyWith(
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 3, bottom: 3),
              child: Text(
                status == "IN PLAY" ? "C" : score.scheduled ?? "",
                style: context.textTheme.labelSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
