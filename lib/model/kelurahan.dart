part of 'model.dart';

class Kelurahan {
  int id;
  String name;

  Kelurahan(this.id, this.name);
  factory Kelurahan.fromJson(Map<String, dynamic> json) => Kelurahan(
    (json['id'] as num).toInt(),
    json['nama'] as String
  );  
}