import 'package:core/navigation/go_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:welcome/splash/application/splash_state.dart';
import 'package:welcome/utils/navigation_constants.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState.initial()) {
    init();
  }

  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 2));

    // User is logged in
    GoManager.instance.replace(path: NavigationConstants.dashboard);
  }
}
