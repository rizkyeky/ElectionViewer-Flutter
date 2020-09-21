part of 'model.dart';

class Admin {
  String id;
  String email;
  String nama;
  
  Admin(this.id, this.email);

  factory Admin.initial() => Admin('', '');
}
