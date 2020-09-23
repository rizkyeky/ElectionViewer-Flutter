part of 'model.dart';

class Admin implements User {
  
  @override
  String email;

  @override
  String id;

  @override
  String name;
  
  Admin(this.id, this.name, this.email);
  factory Admin.initial() => Admin('', '', '');

  @override
  void copyWith({String id, String name, String email}) {
    this.id = id ?? this.id;
    this.name = name ?? this.name;
    this.email = email ?? this.email;
  }
  
  @override
  void duplicate(User user) {
    id = user.id;
    name = user.name;
    email = user.email;
  }
}
