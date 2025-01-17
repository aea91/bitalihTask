import 'package:bitalih/product/go_routes.dart';
import 'package:bitalih/product/injection_contatiner.dart';
import 'package:core/theme/theme.dart';
import 'package:dashboard/utils/injection_contatiner.dart';
import 'package:flutter/material.dart';
import 'package:welcome/utils/injection_contatiner.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialization'ları bekleyelim
  await Future.wait([
    mainInit(),
    getItWelcomeInit(),
    getItDashboardInit(),
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter App Test Case',
      debugShowCheckedModeBanner: false,
      theme: BitalihTheme,
      routerConfig: router,
    );
  }
}
