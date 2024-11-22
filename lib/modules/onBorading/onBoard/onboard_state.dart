part of 'onboard.dart';

class OnboardState extends Equatable {
  final bool isContinueButtonEnable;
  final int currentStep;
  final String selectedPronouns;
  final DateTime userDob;
  final List<String> selectedInterestsList ;
  final int selectedFriendIndex;
  final String selectedGenderType;
  final int selectedFriendAge;
  final String selectedPersonality;

  @override
  List<Object?> get props => [
    isContinueButtonEnable,
    currentStep,
    selectedPronouns,
    userDob,
    selectedInterestsList,
    selectedFriendIndex,
    selectedGenderType,
    selectedFriendAge,
    selectedPersonality
  ];

  const OnboardState(
      {this.isContinueButtonEnable = false,
      this.currentStep = 0,
      this.selectedPronouns = "",
      required this.userDob,
       this.selectedInterestsList= const [],
      this.selectedFriendIndex = 0,
      this.selectedGenderType = "Female",
      this.selectedFriendAge = 18,
      this.selectedPersonality = ""});

  OnboardState copyWith({
    bool? isContinueButtonEnable,
    int? currentStep,
    String? selectedPronouns,
    DateTime? userDob,
    List<String>? selectedInterestsList,
    int? selectedFriendIndex,
    String? selectedGenderType,
    int? selectedFriendAge,
    String? selectedPersonality,
  }) {
    return OnboardState(
      isContinueButtonEnable: isContinueButtonEnable ?? this.isContinueButtonEnable,
      currentStep: currentStep ?? this.currentStep,
      selectedPronouns: selectedPronouns ?? this.selectedPronouns,
      userDob: userDob ?? this.userDob,
      selectedInterestsList: selectedInterestsList ?? this.selectedInterestsList,
      selectedFriendIndex: selectedFriendIndex ?? this.selectedFriendIndex,
      selectedGenderType: selectedGenderType ?? this.selectedGenderType,
      selectedFriendAge: selectedFriendAge ?? this.selectedFriendAge,
      selectedPersonality: selectedPersonality ?? this.selectedPersonality,
    );
  }
}
