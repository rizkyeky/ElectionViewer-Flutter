part of 'model.dart';

abstract class User {
  String id;
  String name;
  String email;


  // factory User.initial() => User();

  void duplicate(User user);

  void copyWith({
    String id,
    String name,
    String email,
  });
}