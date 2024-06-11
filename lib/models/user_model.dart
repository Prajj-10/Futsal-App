import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id, name, email, hobby;
  final int balance;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.hobby = '',
    this.balance = 0,
  });

  @override
  List<Object?> get props => [id, name, email, hobby, balance];
}
