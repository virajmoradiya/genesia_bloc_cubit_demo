part of 'dashboard.dart';

class DashboardScreen extends StatelessWidget {
  static const String routeName = "/dashboard";

  static Widget builder(BuildContext context) {
    return BlocProvider(create: (context) => DashboardCubit(context, const DashboardState()),child: const DashboardScreen(),);

  }

  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                _Header(),
                Expanded(child: _FriendList()),
              ],
            ),
             _StartNewChatButton(),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    final color = context.colorScheme;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Spacing.normal, vertical: Spacing.large),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  context.l10n.genesiaAi,
                  style: context.textTheme.headlineSmall?.copyWith(letterSpacing: 4),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: ShapeBorderRadius.xxLarge,
                  border: Border.all(color: color.onSurface),
                  gradient: LinearGradient(
                    colors: [
                      color.onSurface.withOpacity(.3),
                      color.onSurface.withOpacity(.03),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Row(
                  children: [
                    Assets.icons.ratingStarFilled.image(height: 18),
                    const Gap(Spacing.xSmall),
                    Text(
                      "PRO",
                      style: context.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              const Gap(Spacing.medium),
              CommonButton.cupertino(
                onTap: () {

                  context.navigator.pushNamed(SettingsScreen.routeName);
                },
                child: Icon(
                  Icons.settings,
                  color: color.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        Divider(
          color: color.onSurface.withOpacity(.1),
          thickness: 2,
        ),
      ],
    );
  }
}

class _FriendList extends StatelessWidget {
  const _FriendList();

  @override
  Widget build(BuildContext context) {
    final list = PrefService.instance.aiFriendList;
    final color = context.colorScheme;
    final fontStyle = context.textTheme;
    return ListView.builder(
      itemCount: list.length,
      padding: const EdgeInsets.only(bottom:150),
      itemBuilder: (context, index) {
        final data = list[index];
        return CommonButton.material(
          onTap: () => context.navigator.pushNamed(ChatScreen.routeName,arguments: data),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 20, 12),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: ShapeBorderRadius.xxLarge,
                  child: Image.asset(
                    data.profileImage,
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                const Gap(Spacing.normal),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.name.trim(),
                        style: fontStyle.labelSmall?.copyWith(fontWeight: FontWeight.w500),
                      ),
                      const Gap(Spacing.xSmall),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Hey there! It is ${data.name}. What's up with you, ${data.userName}?".trim(),
                              overflow: TextOverflow.ellipsis,
                              style: fontStyle. labelSmall?.copyWith(color: color.onSurfaceVariant,fontWeight: FontWeight.w400),
                            ),

                          ),
                          const Gap(Spacing.medium),
                          Text("• Now",style:fontStyle. labelSmall?.copyWith(color: color.onSurfaceVariant,fontWeight: FontWeight.w400),)
                        ],
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        );
      },
    );
  }
}


class _StartNewChatButton extends StatelessWidget {
  const _StartNewChatButton();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 50,
      child: Container(
        height: 55,
        margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        width: context.width * .8,
        decoration:BoxDecoration(
          borderRadius: ShapeBorderRadius.xxLarge,
          boxShadow: [
            BoxShadow(color: context.colorScheme.onSurface.withOpacity(.3), blurRadius: 7, spreadRadius: 3),
          ],
        )
            ,
        child: FilledButton(
          onPressed:() {

            CommonFunc.vibrate();
            context.navigator.pushNamed(OnboardScreen.routeName);
          },
          child: Text(
            context.l10n.startNewChat,
            style: context.textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: context.colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }
}
