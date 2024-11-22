part of 'chat.dart';

class ChatScreen extends StatelessWidget {
  static const String routeName = "/chat";

  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AiFriendData data = context.args;

    return Scaffold(
      appBar: AppBar(
        leading: CommonButton.cupertino(
          onTap: () => context.navigator.pop(),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Assets.icons.icBackIcon.image(),
          ),
        ),
        actions: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 60),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: ShapeBorderRadius.xxLarge,
                    child: Image.asset(
                      data.profileImage,
                      height: 40,
                      width: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Gap(Spacing.small),
                  Expanded(
                      child: Text(
                    data.name,
                    style: context.textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w600),
                  ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
