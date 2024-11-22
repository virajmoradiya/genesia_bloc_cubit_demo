class AiFriendData {
  final String profileImage;
  final String name;
  final int age;
  final String gender;
  final String personality;
  final String userName;

  AiFriendData(
      {required this.profileImage, required this.name, required this.age, required this.gender, required this.personality,required this.userName,});

  Map<String, dynamic> toMap() {
    return {
      'profileImage': this.profileImage,
      'name': this.name,
      'age': this.age,
      'gender': this.gender,
      'personality': this.personality,
      'userName': this.userName,
    };
  }

  factory AiFriendData.fromMap(Map<String, dynamic> map) {
    return AiFriendData(
      profileImage: map['profileImage'] as String,
      name: map['name'] as String,
      age: map['age'] as int,
      gender: map['gender'] as String,
      personality: map['personality'] as String,
      userName: map['userName'] as String,
    );
  }
}
