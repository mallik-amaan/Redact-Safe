import 'package:redact_safe/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity{
  const UserModel({
    required super.uid,
    required super.email,
    required super.name,
    super.imageUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'imageUrl': imageUrl,
    };
  }
}