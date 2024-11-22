part of 'language_cubit.dart';

class LanguageStat extends Equatable {

  final Locale locale;

  const LanguageStat({
    required this.locale,
  });

  @override
  List<Object?> get props => [locale];

  LanguageStat copyWith({

    Locale? locale,
  }) {
    return LanguageStat(

      locale: locale ?? this.locale,
    );
  }
}



enum SupportedLanguage {
  english(value: 'en');


  const SupportedLanguage({required this.value});

  final String value;
}
List<Locale> get supportedLocaleList => SupportedLanguage.values.map((lang) => Locale(lang.value)).toList();