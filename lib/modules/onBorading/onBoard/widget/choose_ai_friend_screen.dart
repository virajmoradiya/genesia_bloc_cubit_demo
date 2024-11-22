part of '../onboard.dart';

class _ChooseAiFriendScreen extends StatefulWidget {
  const _ChooseAiFriendScreen();

  @override
  State<_ChooseAiFriendScreen> createState() => _ChooseAiFriendScreenState();
}

class _ChooseAiFriendScreenState extends State<_ChooseAiFriendScreen> with TickerProviderStateMixin {
  PageController friendListPageController = PageController();
  AnimationController? _animationController;
  late ValueNotifier<bool> showAnimation ;
  @override
  void initState() {
    super.initState();

    showAnimation = ValueNotifier(PrefService.instance.isShowSwipeGesture);
    if (showAnimation.value) {
      _animationController = AnimationController(vsync: this);
    }

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        final provider = context.read<OnboardCubit>();
        friendListPageController.jumpToPage(provider.state.selectedFriendIndex);
      },
    );
  }

  @override
  void dispose() {
    if (_animationController != null) {
      _animationController?.dispose();
    }
    friendListPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.read<OnboardCubit>();
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarColor: context.colorScheme.onSecondary.withOpacity(.1)),
      child: Stack(
        children: [
          PageView.builder(
            controller: friendListPageController,
            itemCount: provider.friendsList.length,
            physics: const BouncingScrollPhysics(),
            onPageChanged: provider.changeFriend,
            itemBuilder: (context, index) {
              return Image.asset(
                provider.friendsList[index],
                fit: BoxFit.cover,
              );
            },
          ),
          Positioned(
            left: 80,
            top: 65,
            child: Text(
              context.l10n.chooseYourAiFriend,
              style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
            ),
          ),
          _AiFriendList(
            friendListPageController: friendListPageController,
          ),
          ValueListenableBuilder<bool>(
            valueListenable: showAnimation,
            builder: (context, value, child) {

              if(!value){
                return const SizedBox.shrink();
              }

              return Container(
                height: context.height,
                width: context.width,
                color: context.colorScheme.onSecondary.withOpacity(.3),
                child: Center(
                    child: Assets.animations.swipe.lottie(
                  height: 150,
                  controller: _animationController,
                  repeat: false,
                  onLoaded: (composition) {
                    _animationController
                      ?..duration = composition.duration
                      ..forward().whenComplete(
                        () {
                          showAnimation.value = false;
                          PrefService.instance.setSwipeGestureStatus=false;
                        },
                      );
                  },
                )),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _AiFriendList extends StatelessWidget {
  final PageController friendListPageController;

  const _AiFriendList({required this.friendListPageController});

  @override
  Widget build(BuildContext context) {
    final color = context.colorScheme;
    final provider = context.read<OnboardCubit>();
    final selectedIndex = context.select<OnboardCubit, int>(
      (value) => value.state.selectedFriendIndex,
    );
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 230,
        width: context.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.surface,
              color.surface.withOpacity(.8),
              color.surface.withOpacity(0),
            ],
            stops: const [.6, .7, 1],
            end: Alignment.topCenter,
            begin: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 64,
              child: ListView.builder(
                controller: provider.friendListScrollController,
                itemCount: provider.friendsList.length,
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: (context.width - 78) / 2),
                itemBuilder: (context, index) {
                  return CommonButton.cupertino(
                    onTap: () {
                      provider.changeFriendInPageView(index);
                      friendListPageController.jumpToPage(
                        index,
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: selectedIndex == index ? color.onSurface : Colors.transparent, width: 2)),
                      child: Container(
                        height: 60,
                        width: 60,
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        clipBehavior: Clip.hardEdge,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: Image.asset(
                          provider.friendsList[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
