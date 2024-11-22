part of '../onboard.dart';

class _YourDobScreen extends StatelessWidget {
  const _YourDobScreen();

  @override
  Widget build(BuildContext context) {
    final fontStyle = context.textTheme;
    final color = context.colorScheme;
    final provider = context.read<OnboardCubit>();
    return Center(
      child: Column(
        children: [
          const _HeaderSpace(),
          const Gap(60),
          Text(
            context.l10n.yourDateOfBirth,
            style: fontStyle.headlineLarge?.copyWith(fontWeight: FontWeight.w500),
          ),
          const Gap(Spacing.medium),
          Text(
            context.l10n.knowingYourDateOfBirthMakesnyourExperienceMoreRelevant,
            textAlign: TextAlign.center,
            style: fontStyle.labelMedium?.copyWith(color: color.onSurfaceVariant),
          ),
          const Gap(40),
          SizedBox(
            height: 250,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              dateOrder: DatePickerDateOrder.dmy,
              itemExtent: 40,
              initialDateTime: provider.state.userDob,
              maximumYear: DateTime.now().year,
              maximumDate: DateTime.now(),
              onDateTimeChanged: provider.changeDob,
            ),
          )
        ],
      ),
    );
  }
}
