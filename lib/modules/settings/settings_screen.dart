part of 'settings.dart';

class SettingsScreen extends StatelessWidget {
  static const String routeName = "/settings";

  static Widget builder(BuildContext context) {
    return BlocProvider(create: (context) => SettingsCubit(context, const SettingsState()),child: SettingsScreen(),);

  }

  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: context.height,
      decoration: BoxDecoration(image: DecorationImage(image: Assets.images.background.provider(), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: CommonButton.cupertino(
            onTap: () => context.navigator.pop(),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Assets.icons.icBackIcon.image(),
            ),
          ),
          centerTitle: true,
          title: Text(
            context.l10n.settings,
            style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        body: const SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              children: [
                _BgVideoHandlerTile(),
                Gap(Spacing.normal),
                _ShareGenesiaTile(),
                Gap(Spacing.normal),
                _CompanyDetailsAndSupport(),
                Gap(Spacing.normal),
                _OtherOptions(),
                Gap(Spacing.normal),
                _ResetData(),
                Gap(Spacing.normal),
              ],
            ),),
      ),
    );
  }
}

class _BgVideoHandlerTile extends StatelessWidget {
  const _BgVideoHandlerTile();

  @override
  Widget build(BuildContext context) {
    final status = context.select<SettingsCubit, bool>(
      (value) => value.state.showBackgroundVideo,
    );

    return _DecorateContainer(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 4, 8, 4),
        child: Row(
          children: [
            Expanded(
                child: Text(
                  context.l10n.backgroundVideoOn,
              style: context.textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w600),
            ),),
            Transform.scale(
              scale: .7,
              child: Switch.adaptive(
                value: status,
                onChanged: (value) => context.read<SettingsCubit>().toggleBgVideoStatus(),
                activeTrackColor: Colors.blue,
                inactiveTrackColor: context.colorScheme.onSurface.withOpacity(.2),
                materialTapTargetSize: MaterialTapTargetSize.padded,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DecorateContainer extends StatelessWidget {
  final Widget child;
final void Function()? onTap;
  const _DecorateContainer({required this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return CommonButton.cupertino(
      onTap: onTap,
      child: Container(
        width: context.width,
        decoration: BoxDecoration(color: context.colorScheme.onSurface.withOpacity(.1), borderRadius: ShapeBorderRadius.large),
        child: child,
      ),
    );
  }
}

class _ShareGenesiaTile extends StatelessWidget {
  const _ShareGenesiaTile();

  @override
  Widget build(BuildContext context) {
    return _DecorateContainer(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(20, 14, 16, 14),
      child: Row(
        children: [
          Expanded(
            child: Text(
              context.l10n.shareGenesia,
              style: context.textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          Assets.icons.share.image(height: 28),
        ],
      ),
    ),);
  }
}

class _CompanyDetailsAndSupport extends StatelessWidget {
  const _CompanyDetailsAndSupport();

  @override
  Widget build(BuildContext context) {
    return _DecorateContainer(
        child: Column(
      children: [
        SizedBox(
          height: 55,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 16, 0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    context.l10n.aboutCodeway,
                    style: context.textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                Assets.icons.codewayWhite.image(height: 18),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 55,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 16, 0),
              child: Text(
                context.l10n.likeUsRateUs,
                style: context.textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
        Divider(height: 1,thickness: 1,color: context.colorScheme.onSurface.withOpacity(.05),),

        SizedBox(
          height: 55,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 16, 0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    context.l10n.faqSupport,
                    style: context.textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                const Icon(Icons.keyboard_arrow_right_rounded,size: 24,),
              ],
            ),
          ),
        ),

        SizedBox(
          height: 55,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 16, 0),
              child: Text(
                context.l10n.emailSupport,
                style: context.textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ],
    ),);
  }
}


class _OtherOptions extends StatelessWidget {
  const _OtherOptions();

  @override
  Widget build(BuildContext context) {
    return _DecorateContainer(child: Column(children: [
      SizedBox(
        height: 55,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 16, 0),
            child: Text(
              context.l10n.restorePurchase,
              style: context.textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),  SizedBox(
        height: 55,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 16, 0),
            child: Text(
              context.l10n.privacyPolicy,
              style: context.textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),SizedBox(
        height: 55,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 16, 0),
            child: Text(
              context.l10n.termsOfService,
              style: context.textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    ],),);
  }
}

class _ResetData extends StatelessWidget {
  const _ResetData();

  @override
  Widget build(BuildContext context) {
    return _DecorateContainer(

      onTap:context.read<SettingsCubit>().onReset,
      child:     SizedBox(
      height: 55,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 16, 0),
          child: Text(
            context.l10n.resetData,
            style: context.textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w600,color: context.colorScheme.error),
          ),
        ),
      ),
    ),);
  }
}

