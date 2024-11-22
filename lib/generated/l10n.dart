// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Some thing went wrong`
  String get somethingWentWrong {
    return Intl.message(
      'Some thing went wrong',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Genesia AI`
  String get genesiaAi {
    return Intl.message(
      'Genesia AI',
      name: 'genesiaAi',
      desc: '',
      args: [],
    );
  }

  /// `The Al friend who is\nalways there for you`
  String get theAlFriendWhoIsnalwaysThereForYou {
    return Intl.message(
      'The Al friend who is\nalways there for you',
      name: 'theAlFriendWhoIsnalwaysThereForYou',
      desc: '',
      args: [],
    );
  }

  /// `Let's Start`
  String get letsStart {
    return Intl.message(
      'Let\'s Start',
      name: 'letsStart',
      desc: '',
      args: [],
    );
  }

  /// `By signing up, you agree to our`
  String get bySigningUpYouAgreeToOur {
    return Intl.message(
      'By signing up, you agree to our',
      name: 'bySigningUpYouAgreeToOur',
      desc: '',
      args: [],
    );
  }

  /// `Terms of Service`
  String get termsOfService {
    return Intl.message(
      'Terms of Service',
      name: 'termsOfService',
      desc: '',
      args: [],
    );
  }

  /// `and`
  String get and {
    return Intl.message(
      'and',
      name: 'and',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `What's your name?`
  String get whatsYourName {
    return Intl.message(
      'What\'s your name?',
      name: 'whatsYourName',
      desc: '',
      args: [],
    );
  }

  /// `Introduce yourself to your friend`
  String get introduceYourselfToYourFriend {
    return Intl.message(
      'Introduce yourself to your friend',
      name: 'introduceYourselfToYourFriend',
      desc: '',
      args: [],
    );
  }

  /// `Enter your name`
  String get enterYourName {
    return Intl.message(
      'Enter your name',
      name: 'enterYourName',
      desc: '',
      args: [],
    );
  }

  /// `Create Your Al Friend`
  String get createYourAlFriend {
    return Intl.message(
      'Create Your Al Friend',
      name: 'createYourAlFriend',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continueText {
    return Intl.message(
      'Continue',
      name: 'continueText',
      desc: '',
      args: [],
    );
  }

  /// `Your pronouns`
  String get yourPronouns {
    return Intl.message(
      'Your pronouns',
      name: 'yourPronouns',
      desc: '',
      args: [],
    );
  }

  /// `Which pronoun would you like your\nfriend to call you?`
  String get whichPronounWouldYouLikeYournfriendToCallYou {
    return Intl.message(
      'Which pronoun would you like your\nfriend to call you?',
      name: 'whichPronounWouldYouLikeYournfriendToCallYou',
      desc: '',
      args: [],
    );
  }

  /// `Your date of birth`
  String get yourDateOfBirth {
    return Intl.message(
      'Your date of birth',
      name: 'yourDateOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `Knowing your date of birth makes\nyour experience more relevant`
  String get knowingYourDateOfBirthMakesnyourExperienceMoreRelevant {
    return Intl.message(
      'Knowing your date of birth makes\nyour experience more relevant',
      name: 'knowingYourDateOfBirthMakesnyourExperienceMoreRelevant',
      desc: '',
      args: [],
    );
  }

  /// `Your interests`
  String get yourInterests {
    return Intl.message(
      'Your interests',
      name: 'yourInterests',
      desc: '',
      args: [],
    );
  }

  /// `Your 5 interests to enhance your conversations`
  String get your5InterestsToEnhanceYourConversations {
    return Intl.message(
      'Your 5 interests to enhance your conversations',
      name: 'your5InterestsToEnhanceYourConversations',
      desc: '',
      args: [],
    );
  }

  /// `Choose your AI Friend`
  String get chooseYourAiFriend {
    return Intl.message(
      'Choose your AI Friend',
      name: 'chooseYourAiFriend',
      desc: '',
      args: [],
    );
  }

  /// `Choose name & gender`
  String get chooseNameGender {
    return Intl.message(
      'Choose name & gender',
      name: 'chooseNameGender',
      desc: '',
      args: [],
    );
  }

  /// `Enter Name`
  String get enterName {
    return Intl.message(
      'Enter Name',
      name: 'enterName',
      desc: '',
      args: [],
    );
  }

  /// `You can get a more intimate\nexperience by choosing the age`
  String get youCanGetAMoreIntimatenexperienceByChoosingTheAge {
    return Intl.message(
      'You can get a more intimate\nexperience by choosing the age',
      name: 'youCanGetAMoreIntimatenexperienceByChoosingTheAge',
      desc: '',
      args: [],
    );
  }

  /// `Choose Personality`
  String get choosePersonality {
    return Intl.message(
      'Choose Personality',
      name: 'choosePersonality',
      desc: '',
      args: [],
    );
  }

  /// `Start New Chat`
  String get startNewChat {
    return Intl.message(
      'Start New Chat',
      name: 'startNewChat',
      desc: '',
      args: [],
    );
  }

  /// `Share Genesia`
  String get shareGenesia {
    return Intl.message(
      'Share Genesia',
      name: 'shareGenesia',
      desc: '',
      args: [],
    );
  }

  /// `About Codeway`
  String get aboutCodeway {
    return Intl.message(
      'About Codeway',
      name: 'aboutCodeway',
      desc: '',
      args: [],
    );
  }

  /// `Background Video On`
  String get backgroundVideoOn {
    return Intl.message(
      'Background Video On',
      name: 'backgroundVideoOn',
      desc: '',
      args: [],
    );
  }

  /// `Like us, Rate us 🤍`
  String get likeUsRateUs {
    return Intl.message(
      'Like us, Rate us 🤍',
      name: 'likeUsRateUs',
      desc: '',
      args: [],
    );
  }

  /// `FAQ & Support`
  String get faqSupport {
    return Intl.message(
      'FAQ & Support',
      name: 'faqSupport',
      desc: '',
      args: [],
    );
  }

  /// `Email Support`
  String get emailSupport {
    return Intl.message(
      'Email Support',
      name: 'emailSupport',
      desc: '',
      args: [],
    );
  }

  /// `Restore Purchase`
  String get restorePurchase {
    return Intl.message(
      'Restore Purchase',
      name: 'restorePurchase',
      desc: '',
      args: [],
    );
  }

  /// `Reset Data`
  String get resetData {
    return Intl.message(
      'Reset Data',
      name: 'resetData',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure?`
  String get areYouSure {
    return Intl.message(
      'Are you sure?',
      name: 'areYouSure',
      desc: '',
      args: [],
    );
  }

  /// `All of your data and Al Characters will be erased permanently.`
  String get allOfYourDataAndAlCharactersWillBeErased {
    return Intl.message(
      'All of your data and Al Characters will be erased permanently.',
      name: 'allOfYourDataAndAlCharactersWillBeErased',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
