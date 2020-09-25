part of 'model.dart';

class Pemantau implements User {
  
  @override
  String email;

  @override
  String id;

  @override
  String name;

  bool hakInput;
  Map<String, String> tempat;

  Pemantau(this.id, this.name, this.email, {this.hakInput = true, this.tempat = const {}});
  factory Pemantau.initial() => Pemantau('', '', '');

  @override
  void copyWith({String id, String name, String email, bool hakInput, Map<String, String> tempat}) {
    this.id = id ?? this.id;
    this.name = name ?? this.name;
    this.email = email ?? this.email;
    this.hakInput = hakInput ?? this.hakInput;
    this.tempat = tempat ?? this.tempat;
  }
  
  @override
  void duplicate(User user) {
    id = user.id;
    name = user.name;
    email = user.email;
  }
}