class UserProfile {
  final String userName;
  final String userPronounce;
  final DateTime userDob;
  final List<String> userInterestList;
  final String friendName;
  final String friendGender;
  final int friendAge;
  final String friendPersonality;

  UserProfile(
      {required this.userName,
      required this.userPronounce,
      required this.userDob,
      required this.userInterestList,
      required this.friendName,
      required this.friendGender,
      required this.friendAge,
      required this.friendPersonality});

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'userPronounce': userPronounce,
      'userDob': userDob.toIso8601String(),
      'userInterestList': userInterestList,
      'friendName': friendName,
      'friendGender': friendGender,
      'friendAge': friendAge,
      'friendPersonality': friendPersonality,
    };
  }

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      userName: map['userName'] as String,
      userPronounce: map['userPronounce'] as String,
      userDob: DateTime.parse(map['userDob']),
      userInterestList: List<String>.from(map['userInterestList']),
      friendName: map['friendName'] as String,
      friendGender: map['friendGender'] as String,
      friendAge: map['friendAge'] as int,
      friendPersonality: map['friendPersonality'] as String,
    );
  }
}
