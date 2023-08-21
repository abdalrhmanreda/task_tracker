class UserModel {
  String? name;
  String? email;
  String? profileImage;
  String? age;
  String? uId;

  UserModel({this.name, this.email, this.age, this.profileImage, this.uId});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
    email = json['email'];
    uId = json['uId'];
    profileImage = json['profileImage'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'uId': uId,
      'email': email,
      'age': age,
      'profileImage': profileImage,
    };
  }
}
