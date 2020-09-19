part of 'model.dart';

class Pemantau {
  String id;
  String email;
  
  Pemantau(this.id, this.email);

  factory Pemantau.initial() => Pemantau('', '');
}