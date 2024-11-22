part of 'main.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // localization provider
        BlocProvider(
          create: (context) => LanguageCubit(
            LanguageStat(
              locale: Locale(PrefService.instance.appLanguage.value),
            ),
          ),
          lazy: false,
        ),
      ],
      child: Builder(
        builder: (context) {
          final language = BlocProvider.of<LanguageCubit>(context, listen: true).state;
          return GestureDetector(
            onTap: CommonFunc.closeKeyboard,
            child: MaterialApp(
              builder: (context, child) {
                return MediaQuery(
                    data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
                    child: Builder(builder: (context) {
                      ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
                        return CustomError(errorDetails: errorDetails);
                      };
                      return child!;
                    }));
              },
              debugShowCheckedModeBanner: false,
              themeMode: ThemeMode.light,
              theme: lightTheme,
              onGenerateRoute: RouteManager.onGenerateRoute,
              initialRoute: RouteManager.initRoute,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              locale: language.locale,
              supportedLocales: supportedLocaleList,
              navigatorKey: navigatorKey,
            ),
          );
        },
      ),
    );
  }
}
