import 'package:dashboard/application/dashboard_cubit.dart';
import 'package:dashboard/application/dashboard_state.dart';
import 'package:dashboard/presentation/widget/match_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({super.key, required this.state});

  final DashboardState state;

  @override
  State<DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.state.filteredScores?.length ?? 0,
      itemBuilder: (context, index) {
        return MatchCard(
          couponMap: widget.state.couponMap,
          onSelectedCoupon: (coupon) {
            context
                .read<DashboardCubit>()
                .handleCoupon(widget.state.filteredScores![index], coupon);
            setState(() {});
          },
          onFavorite: (score) {
            context.read<DashboardCubit>().toggleFavoriteScore(score);
            setState(() {});
          },
          score: widget.state.liveScores![index],
          isFavorite: widget.state.favoriteScores
                  ?.where((element) => element.id == widget.state.liveScores![index].id)
                  .isNotEmpty ??
              false,
        );
      },
    );
  }
}
