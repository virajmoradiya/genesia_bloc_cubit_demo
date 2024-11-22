part of '../settings.dart';

class _ResetDialog extends StatelessWidget {
  static Future show({required BuildContext context}) {
    return showDialog(
        context: context,
        builder: (context) => const Dialog(
              shape: RoundedRectangleBorder(borderRadius: ShapeBorderRadius.large),
              insetPadding: EdgeInsets.symmetric(horizontal: Spacing.large),
              child: _ResetDialog(),
            ));
  }

  const _ResetDialog();

  @override
  Widget build(BuildContext context) {
    final color = context.colorScheme;
    final fontStyle = context.textTheme;
    return Padding(
      padding: const EdgeInsets.all(Spacing.xLarge),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            context.l10n.areYouSure,
            style: fontStyle.titleLarge,
          ),
          const Gap(Spacing.normal),
          Text(
            context.l10n.allOfYourDataAndAlCharactersWillBeErased,
            textAlign: TextAlign.center,
            style: fontStyle.labelSmall?.copyWith(color: color.onSurfaceVariant),
          ),
          const Gap(Spacing.xLarge),
          SizedBox(
            height: 50,
            width: context.width,
            child: FilledButton(onPressed: () {
              context.navigator.pop(true);
            }, child: Text(context.l10n.resetData,style: fontStyle.bodyLarge?.copyWith(color: color.error),)),
          ),
          const Gap(Spacing.medium),
          TextButton(onPressed: () {
            context.navigator.pop();
          }, child: Text(context.l10n.cancel,style: fontStyle.bodyLarge,))
        ],
      ),
    );
  }
}
