import 'package:dashboard/application/dashboard_cubit.dart';
import 'package:dashboard/application/dashboard_state.dart';
import 'package:dashboard/presentation/widget/match_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteWidget extends StatefulWidget {
  const FavouriteWidget({super.key, required this.state});

  final DashboardState state;

  @override
  State<FavouriteWidget> createState() => _FavouriteWidgetState();
}

class _FavouriteWidgetState extends State<FavouriteWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.state.favoriteScores?.isEmpty ?? true
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.favorite_border, size: 64, color: Colors.grey),
                const SizedBox(height: 16),
                Text(
                  'Favori Maçınız Bulunamadı',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.grey,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Henüz favori maç eklemediniz',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey,
                      ),
                ),
              ],
            ),
          )
        : ListView.builder(
            itemCount: widget.state.favoriteScores?.length ?? 0,
            itemBuilder: (context, index) {
              return MatchCard(
                couponMap: widget.state.couponMap,
                onSelectedCoupon: (coupon) {
                  context
                      .read<DashboardCubit>()
                      .handleCoupon(widget.state.favoriteScores![index], coupon);
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
