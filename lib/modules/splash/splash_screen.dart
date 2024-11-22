part of 'splash.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "/";

  static Widget builder(BuildContext context) {
    return BlocProvider<SplashCubit>(
      create: (context) => SplashCubit(context, const SplashState()),
      child: BlocBuilder<SplashCubit,SplashState>(

        builder: (context, state) {
          return const SplashScreen();
        },
      ),
    );
  }

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final fontStyle = context.textTheme;
    return Scaffold(
      body: Container(
        height: context.height,
        width: context.width,
        decoration:
            BoxDecoration(image: DecorationImage(image: Assets.images.background.provider(), fit: BoxFit.cover)),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: context.width * .6),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              context.l10n.genesiaAi,
              style: fontStyle.headlineLarge?.copyWith(
                fontWeight: FontWeight.w600,
                letterSpacing: 5,
                fontSize: 40,
              ),
              maxLines: 1,
            ),
          ),
        ),
      ),
    );
  }
}
