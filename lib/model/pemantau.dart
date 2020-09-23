part of 'model.dart';

class Pemantau implements User {
  
  @override
  String email;

  @override
  String id;

  @override
  String name;


  Pemantau(this.id, this.name, this.email);
  factory Pemantau.initial() => Pemantau('', '', '');

  @override
  void copyWith({String id, String name, String email}) {
  }
  
  @override
  void duplicate(User user) {
    id = user.id;
    name = user.name;
    email = user.email;
  }

  
}