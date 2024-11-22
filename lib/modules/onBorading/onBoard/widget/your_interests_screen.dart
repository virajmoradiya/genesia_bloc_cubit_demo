part of '../onboard.dart';

class _YourInterestsScreen extends StatelessWidget {
  const _YourInterestsScreen();

  @override
  Widget build(BuildContext context) {
    final fontStyle = context.textTheme;
    final color = context.colorScheme;
    final provider = context.read<OnboardCubit>();

    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _HeaderSpace(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Spacing.xLarge),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  context.l10n.yourInterests,
                  style: fontStyle.headlineLarge?.copyWith(fontWeight: FontWeight.w500),
                ),
                const Gap(Spacing.medium),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    context.l10n.your5InterestsToEnhanceYourConversations,
                    textAlign: TextAlign.center,
                    style: fontStyle.labelMedium?.copyWith(color: color.onSurfaceVariant),
                  ),
                ),
              ],
            ),
          ),
          const Gap(Spacing.xxLarge),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 150),
              child: Wrap(
                runSpacing: 12,
                spacing: 12,
                crossAxisAlignment: WrapCrossAlignment.start,
                alignment: WrapAlignment.start,
                children: List.generate(provider.interestsList.length, (index) {
                  return _InterestCell(value: provider.interestsList[index]);
                },),
              ),
            ),
          )
        ],
      ),
    );
  }
}




class _InterestCell extends StatelessWidget {
  final String value;
  const _InterestCell({ required this.value});

  @override
  Widget build(BuildContext context) {
    final fontStyle = context.textTheme;
    final color = context.colorScheme;
    final provider = context.read<OnboardCubit>();
    final isSelected = context.select<OnboardCubit,bool>((cubit) => cubit.state.selectedInterestsList.contains(value),);
    final reachLimit = context.select<OnboardCubit,bool>((value) => value.state.selectedInterestsList.length>=5,);
    return Opacity(
      opacity:!isSelected && reachLimit?0.3: 1,
      child: CommonButton.cupertino(
         onTap:!isSelected && reachLimit? null: () {
           CommonFunc.vibrate(amplitude: 3);
           provider.handleInterestSelection(value);
         },
        child: Container(
          padding: const EdgeInsets.all(Spacing.medium),

          decoration: BoxDecoration(
          color: color.onSurface.withOpacity(isSelected?0.2:0.07),
            borderRadius: ShapeBorderRadius.medium,
            border: Border.all(color: color.onSurface.withOpacity(isSelected?1:.1))
          ),
          child: Text(value,style: fontStyle.labelMedium,),
        ),
      ),
    );
  }
}


