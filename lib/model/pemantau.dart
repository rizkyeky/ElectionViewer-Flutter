part of 'model.dart';

class Pemantau {
  String id;
  String email;
  String nama;
  
  Pemantau(this.id, this.nama, this.email);

  factory Pemantau.initial() => Pemantau('', '', '');
}