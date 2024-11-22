part of '../onboard.dart';

class _ChooseNameAndGenderScreen extends StatelessWidget {
  const _ChooseNameAndGenderScreen();

  @override
  Widget build(BuildContext context) {
    final provider = context.read<OnboardCubit>();

    return Stack(
      children: [
        Image.asset(
          provider.friendsList[provider.state.selectedFriendIndex],
          fit: BoxFit.cover,
          height: context.height,
          width: context.width,
        ),
        const _BottomGradient(),
        const _NameAndGenderBox(),
        Positioned(
          left: 80,
          top: 65,
          child: Text(
            context.l10n.chooseNameGender,
            style:
                context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700, color: context.colorScheme.onSurfaceVariant),
          ),
        ),
      ],
    );
  }
}

class _BottomGradient extends StatelessWidget {
  const _BottomGradient();

  @override
  Widget build(BuildContext context) {
    final color = context.colorScheme;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 250,
        width: context.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.surface,
              color.surface.withOpacity(.8),
              color.surface.withOpacity(.01),
            ],
            stops: const [.5, .8, 1],
            end: Alignment.topCenter,
            begin: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }
}

class _NameAndGenderBox extends StatefulWidget {
  const _NameAndGenderBox();

  @override
  State<_NameAndGenderBox> createState() => _NameAndGenderBoxState();
}

class _NameAndGenderBoxState extends State<_NameAndGenderBox> {
  ValueNotifier<bool> enableNextButton = ValueNotifier(false);


  @override
  void initState() {
    super.initState();
    final provider = context.read<OnboardCubit>();
    enableNextButton.value = provider.friendName.text.isNotEmpty;

  }

  @override
  Widget build(BuildContext context) {
    final provider = context.read<OnboardCubit>();
    final selectedGender = context.select<OnboardCubit, String>(
      (value) => value.state.selectedGenderType,
    );
    final color = context.colorScheme;
    final fontStyle = context.textTheme;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: Spacing.xxxLarge + MediaQuery.of(context).viewInsets.bottom),
        child: ClipRRect(
          borderRadius: ShapeBorderRadius.large,

          child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 15,sigmaY: 15),
            child: Container  (

              width: 320,
              height: 123,
              decoration: BoxDecoration(
                color: color.onSurface.withOpacity(0.3),
                borderRadius: ShapeBorderRadius.large,
              ),
              child: Padding(
                padding: const EdgeInsets.all(Spacing.medium),
                child: Stack(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 200,
                          child: TextFormField(
                            controller: provider.friendName,
                            onChanged: (value) {
                              enableNextButton.value = value.isNotEmpty;
                            },
                            textAlign: TextAlign.center,
                            style: fontStyle.headlineMedium?.copyWith(fontWeight: FontWeight.w400),
                            textCapitalization: TextCapitalization.words,
                            decoration: InputDecoration(
                              hintText: context.l10n.enterName,
                              hintStyle:
                                  fontStyle.headlineMedium?.copyWith(fontWeight: FontWeight.w400, color: color.onSurface.withOpacity(.6)),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const Gap(Spacing.medium),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            provider.genderTypes.length,
                            (index) {
                              bool isSelected = provider.genderTypes[index] == selectedGender;
                              return CommonButton.cupertino(
                                onTap: () => provider.changeGender(index),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                                  decoration: BoxDecoration(
                                      color: color.onSurface.withOpacity(isSelected ? 0.4 : 0.1),
                                      borderRadius: ShapeBorderRadius.xxLarge,
                                      border: Border.all(
                                        color: isSelected ? color.onSurface : Colors.transparent,
                                      )),
                                  child: Text(
                                    provider.genderTypes[index],
                                    style: fontStyle.labelMedium?.copyWith(fontWeight: FontWeight.w500),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: ValueListenableBuilder<bool>(
                        valueListenable: enableNextButton,
                        builder: (context, value, child) {
                          return CommonButton.cupertino(
                            onTap: () {
                              CommonFunc.closeKeyboard();
                              if (provider.friendName.text.isNotEmpty) {
                                provider.onContinue();
                              }
                            },
                            child: Container(
                              height: 28,
                              width: 28,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: color.onSurface.withOpacity(value?1:0.3),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                Icons.keyboard_arrow_right_rounded,
                                color: color.primary,
                                size: 22,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
