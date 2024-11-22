part of 'splash.dart';

class SplashCubit extends BaseCubit<SplashState> {
  SplashCubit(
    super.context,
    super.initialState,
  );

  @override
  void onCreate() {
    _changeScreen();

    super.onCreate();
  }

  void _changeScreen() {
    Timer(2.seconds, () {
      switch (prefService.currentInitialScreen) {
        case InitialScreenType.welcome:
          context.navigator.pushReplacementNamed(WelcomeScreen.routeName);

        case InitialScreenType.enterYourName:
          context.navigator.pushReplacementNamed(OnboardScreen.routeName);
        case InitialScreenType.dashboard:
          context.navigator.pushReplacementNamed(DashboardScreen.routeName);
      }
    });
  }
}
