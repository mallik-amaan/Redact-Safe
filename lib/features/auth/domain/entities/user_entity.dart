import 'package:equatable/equatable.dart';

class UserEntity extends Equatable{
  final String uid;
  final String email;
  final String name;
  final String? imageUrl;

  const UserEntity({
    required this.uid,
    required this.email,
    required this.name,
    this.imageUrl,
  });

  @override
  List<Object?> get props => [uid, email, name, imageUrl];

  @override
  String toString() {
    return 'UserEntity(id: $uid, email: $email, name: $name, imageUrl: $imageUrl)';
  }
}