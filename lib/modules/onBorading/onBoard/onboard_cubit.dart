part of 'onboard.dart';

class OnboardCubit extends BaseCubit<OnboardState> {
  OnboardCubit(super.context, super.initialState);

  TextEditingController nameController = TextEditingController();

  PageController pageController = PageController();
  ScrollController friendListScrollController = ScrollController();

  final List pronounsList = ["She / Her", "He / Him", "They / Them"];

  final List<String> interestsList = [
    "🎨 Art and Creativity",
    "📚 Literature",
    "🎥 Movies and TV Shows",
    "💃 Dancing",
    "🐶 Pets and Animals",
    "🌱 Gardening",
    "🌍 Volunteering",
    "💻 Technology",
    "👗 Fashion",
    "✈️ Travel",
    "🎵 Music",
    "⚽️ Sports",
    "🎮 Gaming",
    "💼 Career",
    "🍳 Cooking",
    "💪 Fitness",
    "☕️ Coffee",
    "💭 Philosophy/Existential questions",
    "🎭 Theater and Performing Arts",
    "🌍 Environmental Sustainability"
  ];
  List friendsList = [
    Assets.images.aiModel1.path,
    Assets.images.aiModel2.path,
    Assets.images.aiModel3.path,
    Assets.images.aiModel1.path,
    Assets.images.aiModel2.path,
    Assets.images.aiModel3.path,
    Assets.images.aiModel1.path,
    Assets.images.aiModel2.path,
    Assets.images.aiModel3.path,
    Assets.images.aiModel1.path,
    Assets.images.aiModel2.path,
    Assets.images.aiModel3.path,
  ];
  List genderTypes = ["Female", "Male", "Non-Binary"];
  TextEditingController friendName = TextEditingController();

  @override
  void onCreate() {
    super.onCreate();
    emit(state.copyWith(selectedPronouns: pronounsList.first));
    if (PrefService.instance.userProfile != null) {
      _fillInitialValues();
    }
  }

  void nameValidationChecker(String value) {
    if (state.isContinueButtonEnable != value.isNotEmpty) {
      emit(state.copyWith(isContinueButtonEnable: value.isNotEmpty));
    }
  }

  Future<void> onContinue() async {
    CommonFunc.vibrate();
    CommonFunc.closeKeyboard();
    if (MediaQuery.of(context).viewInsets.bottom != 0) {
      await Future.delayed(200.milliseconds);
    }
    if (state.currentStep == 7) {
      _createFriend();
      return;
    }
    emit(state.copyWith(currentStep: state.currentStep + 1));
    if (state.currentStep == 3) {
      emit(state.copyWith(isContinueButtonEnable: state.selectedInterestsList.isNotEmpty));
    }
    pageController.animateToPage(state.currentStep, duration: 300.milliseconds, curve: Curves.easeIn);
  }

  void onBack() {
    emit(state.copyWith(isContinueButtonEnable: true, currentStep: state.currentStep - 1));
    pageController.animateToPage(state.currentStep, duration: 300.milliseconds, curve: Curves.easeIn);
  }

  void changePronouns(int index) {
    emit(state.copyWith(selectedPronouns: pronounsList[index]));
  }

  void changeDob(DateTime dateTime) {
    emit(state.copyWith(userDob: dateTime));
  }

  void handleInterestSelection(String value) {
    if (state.selectedInterestsList.contains(value)) {
      emit(state.copyWith(selectedInterestsList: [...state.selectedInterestsList]..remove(value)));
    } else {
      emit(state.copyWith(selectedInterestsList: [...state.selectedInterestsList, value]));
    }
    emit(state.copyWith(isContinueButtonEnable: state.selectedInterestsList.isNotEmpty));
  }

  void changeFriend(int index) {
    emit(state.copyWith(selectedFriendIndex: index));

    _scrollToCenter(index);
  }

  void _scrollToCenter(int index) {
    const itemWidth = 78; // Width of each item
    final targetOffset = (itemWidth * (index)).toDouble();

    friendListScrollController.animateTo(
      targetOffset,
      duration: 300.milliseconds,
      curve: Curves.easeIn,
    );
  }

  void changeFriendInPageView(int index) {
    emit(state.copyWith(selectedFriendIndex: index));
  }

  void changeGender(int index) {
    emit(state.copyWith(selectedGenderType: genderTypes[index]));
  }

  void changeFriendAge(int age) {
    emit(state.copyWith(selectedFriendAge: age));
  }

  void selectFriendPersonality(String value) {
    emit(state.copyWith(selectedPersonality: value));
  }

  void _createFriend() {
    prefService.setUserProfile = UserProfile(
      userName: nameController.text,
      userPronounce: state.selectedPronouns,
      userDob: state.userDob,
      userInterestList: state.selectedInterestsList,
      friendName: friendName.text,
      friendGender: state.selectedGenderType,
      friendAge: state.selectedFriendAge,
      friendPersonality: state.selectedPersonality,
    );

    prefService.addAiFriend = AiFriendData(
        profileImage: friendsList[state.selectedFriendIndex],
        name: friendName.text,
        age: state.selectedFriendAge,
        gender: state.selectedGenderType,
        personality: state.selectedPersonality,
        userName: nameController.text);

    _afterCreateFriend();
  }

  void _afterCreateFriend() {
    if (prefService.userProfile != null) {
      context.navigator.pushNamedAndRemoveUntil(
        DashboardScreen.routeName,
        (route) => false,
      );
    } else {
      context.navigator.pushReplacementNamed(DashboardScreen.routeName);
    }
    prefService.setInitialScreen = InitialScreenType.dashboard;
  }

  void _fillInitialValues() {
    final user = prefService.userProfile;
    nameController.text = user?.userName ?? "";

    friendName.text = user?.friendName ?? "";

    emit(state.copyWith(
      selectedGenderType: user?.friendGender ?? "",
      selectedFriendAge: user?.friendAge ?? 18,
      selectedPersonality: user?.friendPersonality ?? "",
      isContinueButtonEnable: nameController.text.isNotEmpty,
      selectedPronouns: user?.userPronounce ?? "",
      userDob: user?.userDob ?? DateTime.now(),
      selectedInterestsList: [...user?.userInterestList ?? []],
    ));
  }
}
