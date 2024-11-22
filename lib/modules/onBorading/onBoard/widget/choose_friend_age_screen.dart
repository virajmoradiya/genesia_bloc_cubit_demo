part of '../onboard.dart';

class _ChooseFriendAgeScreen extends StatelessWidget {
  const _ChooseFriendAgeScreen();

  @override
  Widget build(BuildContext context) {
    final fontStyle = context.textTheme;
    final color = context.colorScheme;
    final provider = context.read<OnboardCubit>();

    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        child: Column(
          children: [
            const _HeaderSpace(),
            const Gap(60),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Spacing.xLarge),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "${provider.friendName.text}'s Age",
                    style: fontStyle.headlineLarge?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  const Gap(Spacing.medium),
                  Text(
                    context.l10n.youCanGetAMoreIntimatenexperienceByChoosingTheAge,
                    textAlign: TextAlign.center,
                    style: fontStyle.labelSmall?.copyWith(color: color.onSurfaceVariant),
                  ),
                ],
              ),
            ),
            const Gap(30),
            const _AgeList(),
          ],
        ));
  }
}

class _AgeList extends StatefulWidget {
  const _AgeList();

  @override
  State<_AgeList> createState() => _AgeListState();
}

class _AgeListState extends State<_AgeList> {
  final FixedExtentScrollController pageController = FixedExtentScrollController();

  List ageList = List.generate(
    82,
    (index) => 99 - index,
  );

  @override
  void initState() {
    final provider = context.read<OnboardCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      pageController.jumpToItem(ageList.indexOf(provider.state.selectedFriendAge));
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
    final selectedValue = context.select<OnboardCubit, int>(
      (value) => value.state.selectedFriendAge,
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
              onSelectedItemChanged: (value) => provider.changeFriendAge(ageList[value]),
              overAndUnderCenterOpacity: 0.5,
              children: ageList.map(
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
