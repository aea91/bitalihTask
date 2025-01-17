import 'package:flutter/material.dart';

class BaseView extends StatelessWidget {
  final Widget body;
  final AppBar? appBar;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  const BaseView({
    super.key,
    required this.body,
    this.appBar,
    this.floatingActionButton,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SafeArea(child: body),
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
