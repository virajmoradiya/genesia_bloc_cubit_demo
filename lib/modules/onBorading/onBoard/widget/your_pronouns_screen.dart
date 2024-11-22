part of '../onboard.dart';

class _YourPronounsScreen extends StatelessWidget {
  const _YourPronounsScreen();

  @override
  Widget build(BuildContext context) {
    final fontStyle = context.textTheme;
    final color = context.colorScheme;
    return Center(
        child: Column(
      children: [
        const _HeaderSpace(),
        const Gap(60),
        Text(
          context.l10n.yourPronouns,
          style: fontStyle.headlineLarge?.copyWith(fontWeight: FontWeight.w500),
        ),
        const Gap(Spacing.medium),
        Text(
          context.l10n.whichPronounWouldYouLikeYournfriendToCallYou,
          textAlign: TextAlign.center,
          style: fontStyle.labelMedium?.copyWith(color: color.onSurfaceVariant),
        ),
        const Gap(35),
        const _PronounsList(),
      ],
    ));
  }
}

class _PronounsList extends StatefulWidget {
  const _PronounsList();

  @override
  State<_PronounsList> createState() => _PronounsListState();
}

class _PronounsListState extends State<_PronounsList> {
  final FixedExtentScrollController pageController = FixedExtentScrollController();
  
  @override
  void initState() {
    final provider =context.read<OnboardCubit>();
    WidgetsBinding.instance
        .addPostFrameCallback((_) {

      pageController.jumpToItem(provider.pronounsList.indexOf(provider.state.selectedPronouns));
    });

    super.initState();
  }
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    final provider = context.read<OnboardCubit>();
    final selectedValue = context.select<OnboardCubit, String>(
      (value) => value.state.selectedPronouns,
    );
    final color = context.colorScheme;
    final fontStyle = context.textTheme;
    return SizedBox(
      height: 200,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 45,
            width: context.width * .75,
            decoration: BoxDecoration(
              color: color.onSurface.withOpacity(.15),
              borderRadius: ShapeBorderRadius.normal,
            ),
          ),
          ListWheelScrollView(
              itemExtent: 45,
              perspective: .01,
              diameterRatio: 2,
              controller: pageController,
              physics: const FixedExtentScrollPhysics(),
              onSelectedItemChanged: provider.changePronouns,
              overAndUnderCenterOpacity: 0.5,
              children: provider.pronounsList.map(
                (e) {
                  bool isSelected = selectedValue == e;
                  return Align(
                    alignment: Alignment.center,
                    child: Text(
                      "$e",
                      style: fontStyle.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w500,

                        color: isSelected ? color.onSurface : color.onSurfaceVariant,
                      ),
                    ),
                  );
                },
              ).toList()),
        ],
      ),
    );
  }
}
