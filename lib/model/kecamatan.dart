part of 'model.dart';

class Kecamatan {
  int id;
  String name;

  Kecamatan(this.id, this.name);
  factory Kecamatan.fromJson(Map<String, dynamic> json) => Kecamatan(
    (json['id'] as num).toInt(),
    json['nama'] as String
  );

  @override
  String toString() => name; 
}