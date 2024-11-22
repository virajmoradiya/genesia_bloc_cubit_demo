part of 'settings.dart';

class SettingsCubit extends BaseCubit<SettingsState> {
  SettingsCubit(super.context, super.initialState);
  @override
  void onCreate() {
    super.onCreate();
    emit(state.copyWith(showBackgroundVideo :PrefService.instance.isShowBgVideo));

  }


  void toggleBgVideoStatus(){
    emit(state.copyWith(showBackgroundVideo :!state.showBackgroundVideo));
    prefService.setShowBgVideoStatus = state.showBackgroundVideo;
  }

  Future<void> onReset() async {
    bool? reset = await _ResetDialog.show(context: context);
    if((reset??false )&& context.mounted){

      PrefService.instance.clear();
      context.navigator.pushNamedAndRemoveUntil(WelcomeScreen.routeName, (route) => false,);
    }
  }
}
