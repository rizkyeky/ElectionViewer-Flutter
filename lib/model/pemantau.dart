part of 'model.dart';

class Pemantau implements User {
  
  @override
  String email;

  @override
  String id;

  @override
  String name;

  bool hakInput;

  Pemantau(this.id, this.name, this.email, {this.hakInput = true});
  factory Pemantau.initial() => Pemantau('', '', '');

  @override
  void copyWith({String id, String name, String email, bool hakInput}) {
    this.id = id ?? this.id;
    this.name = name ?? this.name;
    this.email = email ?? this.email;
    this.hakInput = hakInput ?? this.hakInput; 
  }
  
  @override
  void duplicate(User user) {
    id = user.id;
    name = user.name;
    email = user.email;
  }

  
}