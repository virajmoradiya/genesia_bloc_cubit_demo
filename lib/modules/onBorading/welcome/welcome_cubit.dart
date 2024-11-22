part of 'welcome.dart';

class WelcomeCubit extends BaseCubit<WelcomeState> {
  WelcomeCubit(super.context, super.initialState);

  @override
  void onCreate() {
    super.onCreate();

    _initialiseWelcomeVideo();
  }

  Future<void> _initialiseWelcomeVideo() async {
    emit(state.copyWith(videoPlayerController: VideoPlayerController.asset(Assets.video.welcomeVideo)));
    await state.videoPlayerController?.initialize();
    emit(state.copyWith(isLoading: false));
    state.videoPlayerController?.play();
    state.videoPlayerController?.setLooping(true);
  }

  @override
  void onDispose() {
    state.videoPlayerController?.pause();
    state.videoPlayerController?.dispose();
    super.onDispose();
  }

  void onStart() {
    CommonFunc.vibrate();
    prefService.setInitialScreen = InitialScreenType.enterYourName;
    context.navigator.pushReplacementNamed(OnboardScreen.routeName);
  }
}
