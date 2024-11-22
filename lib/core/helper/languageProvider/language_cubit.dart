import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genesia_demo/services/preferenceService/pref_manager.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageStat> {
  LanguageCubit(super.initialState) {
    _init();
  }

  PrefService prefService = PrefService.instance;

  void _init() {
    state.copyWith(locale: Locale(prefService.appLanguage.value));
  }

  void changeLanguage(SupportedLanguage language) {
    state.copyWith(locale: Locale(language.value));
    prefService.setAppLanguage = language;
  }
}
