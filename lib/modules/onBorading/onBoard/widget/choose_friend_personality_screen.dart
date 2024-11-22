part of '../onboard.dart';

class _ChooseFriendPersonalityScreen extends StatefulWidget {
  const _ChooseFriendPersonalityScreen();

  @override
  State<_ChooseFriendPersonalityScreen> createState() => _ChooseFriendPersonalityScreenState();
}

class _ChooseFriendPersonalityScreenState extends State<_ChooseFriendPersonalityScreen> {


  List<PersonalityData> personalityList = [
    PersonalityData(emoji: "😉", title: "Flirty & Relaxed"),
    PersonalityData(emoji: "😏", title: "Flirty & Toxic"),
    PersonalityData(emoji: "😜", title: "Flirty & Funny"),
    PersonalityData(emoji: "🥰", title: "Romantic & Positive"),
    PersonalityData(emoji: "😎", title: "Dominant & Confident"),
    PersonalityData(emoji: "🤗", title: "Shy & Supportive"),
    PersonalityData(emoji: "🤩", title: "Funny & Creative"),
    PersonalityData(emoji: "🤓", title: "Funny & Nerd"),


  ];

  @override
  void initState() {

    super.initState();
    final provider = context.read<OnboardCubit>();
    if(provider.state.selectedPersonality.isEmpty){
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) => provider.selectFriendPersonality(personalityList.first.title),);
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.read<OnboardCubit>();
    final selectedValue = context.select<OnboardCubit, String>(
      (value) => value.state.selectedPersonality,
    );
    final color = context.colorScheme;
    final fontStyle = context.textTheme;
    return Column(
      children: [
        const Gap(65),
        Text(
          context.l10n.choosePersonality,
          style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700, color: context.colorScheme.onSurface),
        ),
        const Gap(Spacing.medium),
        Text(
          "Characteristics of your Al Friend",
          style: context.textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w500,
            color: context.colorScheme.onSurfaceVariant,
          ),
        ),
        const Gap(Spacing.xxLarge),
        Expanded(
            child: GridView.builder(
          itemCount: personalityList.length,
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 150),
          gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 12,crossAxisSpacing: 12,mainAxisExtent: 110),
          itemBuilder: (context, index) {
            bool isSelected = selectedValue == personalityList[index].title;
            return CommonButton.cupertino(
              onTap: () => provider.selectFriendPersonality(personalityList[index].title),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: context.width*.05),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: color.onSurface.withOpacity(isSelected?0.3:0.15),
                  borderRadius: ShapeBorderRadius.medium,border: Border.all(color:isSelected? color.onSurface:Colors.transparent,)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      personalityList[index].emoji,
                      style: const TextStyle(fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      personalityList[index].title,
                      style: fontStyle.titleSmall?.copyWith(fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        ))
      ],
    );
  }
}


class PersonalityData{
  final String emoji;
  final String title;

  PersonalityData({required this.emoji, required this.title});
}