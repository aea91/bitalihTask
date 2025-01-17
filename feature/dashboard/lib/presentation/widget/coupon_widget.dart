import 'package:core/extensions/context_extensions.dart';
import 'package:dashboard/application/dashboard_cubit.dart';
import 'package:dashboard/application/dashboard_state.dart';
import 'package:dashboard/presentation/widget/coupon_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CouponWidget extends StatelessWidget {
  const CouponWidget({super.key, required this.state});

  final DashboardState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        state.couponMap.isEmpty
            ? _CouponEmptyWidget()
            : SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: ListView.builder(
                  itemCount: state.couponMap.keys.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return CouponCard(
                      score: state.couponMap.keys.elementAt(index),
                      onSelectedCoupon: (coupon) => context
                          .read<DashboardCubit>()
                          .handleCoupon(state.couponMap.keys.elementAt(index), coupon),
                      couponMap: state.couponMap,
                    );
                  },
                ),
              ),
        _TotalWidget(state: state),
      ],
    );
  }
}

class _TotalWidget extends StatelessWidget {
  const _TotalWidget({
    super.key,
    required this.state,
  });

  final DashboardState state;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: state.couponMap.isNotEmpty,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Toplam: ${state.total.toStringAsFixed(2)}',
              style: context.textTheme.titleMedium,
            ),
            SizedBox(
              width: 120,
              child: TextField(
                onChanged: (value) {
                  context.read<DashboardCubit>().calculateTotal(value: value);
                },
                decoration: const InputDecoration(
                  hintText: 'Tutar',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  suffixText: 'TL',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CouponEmptyWidget extends StatelessWidget {
  const _CouponEmptyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.receipt_long, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            Text(
              'Kupon Bulunamadı',
              style: context.textTheme.titleLarge?.copyWith(
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Henüz bir kupon oluşturmadınız',
              style: context.textTheme.bodyMedium?.copyWith(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
