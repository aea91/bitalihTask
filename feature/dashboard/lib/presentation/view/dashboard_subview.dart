part of 'dashboard_view.dart';

class _BottomBar extends StatelessWidget {
  const _BottomBar({
    required this.state,
  });
  final DashboardState state;

  @override
  Widget build(BuildContext context) {
    return DashboardBottomBar(
      currentIndex: state.index,
      onTap: (index) => context.read<DashboardCubit>().setIndex(index),
    );
  }
}

class _FilterButton extends StatelessWidget {
  const _FilterButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.filter_list),
      onPressed: () => context.read<DashboardCubit>().showFilterDialog(context),
    );
  }
}

class _SortButton extends StatelessWidget {
  const _SortButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.sort),
      onPressed: () => context.read<DashboardCubit>().showSortDialog(context),
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: context.read<DashboardCubit>().searchController,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        suffixIcon: InkWell(
          onTap: () {
            context.read<DashboardCubit>().clearSearch();
          },
          child: const Icon(Icons.clear),
        ),
        hintText: 'Maç ara...',
        border: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      onChanged: (value) {
        context.read<DashboardCubit>().searchScore(value);
      },
    );
  }
}
