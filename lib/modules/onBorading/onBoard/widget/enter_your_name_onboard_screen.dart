part of '../onboard.dart';

class _EnterYourNameOnboardScreen extends StatelessWidget {
  const _EnterYourNameOnboardScreen();

  @override
  Widget build(BuildContext context) {
    final fontStyle = context.textTheme;
    final color = context.colorScheme;
    return Center(
      child: Column(

        children: [
          const _HeaderSpace(),
           Gap(context.height*.03),
          Text(
            context.l10n.whatsYourName,
            style: fontStyle.headlineLarge?.copyWith(fontWeight: FontWeight.w500),
          ),
          const Gap(Spacing.medium),
          Text(
            context.l10n.introduceYourselfToYourFriend,
            style: fontStyle.labelMedium?.copyWith(color: color.onSurfaceVariant),
          ),
          Gap(context.height * .1),
          const _NameField(),

        ],
      ),
    );
  }
}

class _NameField extends StatelessWidget {
  const _NameField();

  @override
  Widget build(BuildContext context) {
    final fontStyle = context.textTheme;
    final color = context.colorScheme;
    final provider = context.read<OnboardCubit>();
    return SizedBox(
      width: context.width * .7,
      child: TextFormField(
        controller: provider.nameController,
        autofocus: true,
        onChanged: provider.nameValidationChecker,
        textAlign: TextAlign.center,
        style: fontStyle.headlineLarge?.copyWith(
          fontWeight: FontWeight.w500,
        ),
        cursorColor: color.onSurface,
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: color.onSurface)),
          hintText: context.l10n.enterYourName,
          hintStyle: fontStyle.headlineLarge?.copyWith(fontWeight: FontWeight.w500, color: color.onSurfaceVariant),
        ),
      ),
    );
  }
}