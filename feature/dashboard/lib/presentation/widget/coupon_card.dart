import 'package:dashboard/domain/entity/score_entity.dart';
import 'package:dashboard/presentation/widget/odds_field.dart';
import 'package:dashboard/presentation/widget/score_field.dart';
import 'package:dashboard/presentation/widget/score_header.dart';
import 'package:flutter/material.dart';

class CouponCard extends StatelessWidget {
  const CouponCard({
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
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            ScoreHeader(score: score),
            ScoreField(score: score),
            OddsField(score: score, onSelectedCoupon: onSelectedCoupon, couponMap: couponMap),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
