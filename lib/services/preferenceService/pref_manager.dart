import 'dart:convert';

import 'package:genesia_demo/core/helper/languageProvider/language_cubit.dart';
import 'package:genesia_demo/model/ai_friend_data.dart';
import 'package:genesia_demo/model/user_profile.dart';
import 'package:genesia_demo/utils/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'pref_key.dart';

class PrefService {
  PrefService._();

  static final PrefService _instance = PrefService._();

  static PrefService get instance => _instance;

  SharedPreferences? prefs;

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  // app language
  set setAppLanguage(SupportedLanguage lang) => prefs?.setString(PrefKey.appLanguage, lang.value);

  SupportedLanguage get appLanguage => SupportedLanguage.values
      .where((element) => element.value == (prefs?.getString(PrefKey.appLanguage) ?? SupportedLanguage.english.value))
      .first;

  // on Boarding screen
  set setInitialScreen(InitialScreenType screen) => prefs?.setString(PrefKey.onBoardingScreen, screen.name);

  InitialScreenType get currentInitialScreen => InitialScreenType.values
      .where((element) => element.name == (prefs?.getString(PrefKey.onBoardingScreen) ?? InitialScreenType.welcome.name))
      .first;

  // userName
  set setUserProfile(UserProfile profile) => prefs?.setString(PrefKey.userProfile, jsonEncode(profile.toMap()));
  UserProfile? get userProfile {
    final data = prefs?.getString(PrefKey.userProfile);
    if(data==null) return null;
    return UserProfile.fromMap(jsonDecode(data));
  }

  // ai friend list
  set addAiFriend(AiFriendData data) => prefs?.setString(PrefKey.aiFriendList, jsonEncode((aiFriendList+[data]).map((e) => e.toMap(),).toList()));

  List<AiFriendData> get aiFriendList{
    String? data = prefs?.getString(PrefKey.aiFriendList);
    if(data==null) return[];
    List<AiFriendData> friendList = (jsonDecode(data)as List).map((e) => AiFriendData.fromMap(e as Map<String, dynamic>)).toList();
    return friendList;
  }



  // swipe gesture on choose your ai friend screen
  set setSwipeGestureStatus(bool status)=> prefs?.setBool(PrefKey.showSwipeGesture, status);

  bool get isShowSwipeGesture => prefs?.getBool(PrefKey.showSwipeGesture)??true;

  // show background video
  set setShowBgVideoStatus(bool status)=> prefs?.setBool(PrefKey.showBgVideo, status);

  bool get isShowBgVideo => prefs?.getBool(PrefKey.showBgVideo)??true;

  void clear() {
    SupportedLanguage lang = appLanguage;
    prefs?.clear();
    setAppLanguage = lang;
  }
}
