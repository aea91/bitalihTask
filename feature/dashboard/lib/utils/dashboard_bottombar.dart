import 'package:flutter/material.dart';

class DashboardBottomBar extends StatelessWidget {
  const DashboardBottomBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.sports_soccer),
          label: 'İddia',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.receipt_long),
          label: 'Kupon',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.star),
          label: 'Favoriler',
        ),
      ],
    );
  }
}
