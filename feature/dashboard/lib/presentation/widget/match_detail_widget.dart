import 'package:dashboard/domain/entity/score_entity.dart';
import 'package:flutter/material.dart';
import 'package:core/extensions/context_extensions.dart';

class MatchDetailWidget extends StatelessWidget {
  const MatchDetailWidget({super.key, required this.score});

  final ScoreEntity score;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    score.league_name ?? '',
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: score.status == 'IN PLAY' ? Colors.green : Colors.grey,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      score.status ?? '',
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    score.home_name ?? '',
                    style: context.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    score.score ?? '0 - 0',
                    style: context.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade900,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    score.away_name ?? '',
                    style: context.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            if (score.scheduled != null) ...[
              _buildInfoRow(
                context: context,
                icon: Icons.calendar_today,
                label: 'Tarih',
                value: score.scheduled ?? '',
              ),
              const SizedBox(height: 12),
            ],
            if (score.time != null) ...[
              _buildInfoRow(
                context: context,
                icon: Icons.timer,
                label: 'Süre',
                value: score.time ?? '',
              ),
              const SizedBox(height: 12),
            ],
            if (score.location != null)
              _buildInfoRow(
                context: context,
                icon: Icons.location_on,
                label: 'Konum',
                value: score.location ?? '',
              ),
            if (score.competition_name != null) ...[
              const SizedBox(height: 12),
              _buildInfoRow(
                context: context,
                icon: Icons.emoji_events,
                label: 'Turnuva',
                value: score.competition_name ?? '',
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow({
    required BuildContext context,
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.grey.shade600),
        const SizedBox(width: 8),
        Text(
          '$label: ',
          style: context.textTheme.bodyMedium?.copyWith(
            color: Colors.grey.shade600,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          value,
          style: context.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
