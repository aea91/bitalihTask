import 'package:core/base/view/base_view.dart';
import 'package:dashboard/application/dashboard_cubit.dart';
import 'package:dashboard/application/dashboard_state.dart';
import 'package:dashboard/application/dashboard_status.dart';
import 'package:dashboard/presentation/widget/coupon_widget.dart';
import 'package:dashboard/presentation/widget/dashboard_widget.dart';
import 'package:dashboard/presentation/widget/favourite_widget.dart';
import 'package:dashboard/utils/dashboard_bottombar.dart';
import 'package:dashboard/utils/dashboard_pages.dart';
import 'package:dashboard/utils/injection_contatiner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dashboard_subview.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<DashboardCubit>()..init(),
      child: StreamBuilder(
        stream: Stream.periodic(const Duration(seconds: 120)),
        builder: (context, snapshot) {
          context.read<DashboardCubit>().triggerLiveScore();
          return BlocConsumer<DashboardCubit, DashboardState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state.status == DashboardStatus.loading) {
                return const Center(child: CircularProgressIndicator());
              }
              return BaseView(
                appBar: AppBar(
                  title: Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: _SearchField(),
                  ),
                  actions: [
                    _SortButton(),
                    _FilterButton(),
                  ],
                ),
                bottomNavigationBar: _BottomBar(state: state),
                body: state.index == DashboardPages.iddia.value
                    ? DashboardWidget(state: state)
                    : state.index == DashboardPages.favoriler.value
                        ? FavouriteWidget(state: state)
                        : CouponWidget(state: state),
              );
            },
          );
        },
      ),
    );
  }
}
