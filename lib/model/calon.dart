part of 'model.dart';

class Calon {
  String id;
  String name;
  int number;
  int totalSuara;
  int sahSuara;
  int tidaksahSuara;

  Calon(this.id, this.name, this.number, {
    this.totalSuara = 0, 
    this.sahSuara = 0, 
    this.tidaksahSuara = 0, 
  });
  factory Calon.initial() => Calon('', '', 0);

  void copyWith({
    String id,
    String name,
    int number,
    int totalSuara,
    int sahSuara,
    int tidaksahSuara,    
  }) {
    this.id = id ?? this.id;
    this.name = name ?? this.name;
    this.number = number ?? this.number;
    this.totalSuara = totalSuara ?? this.totalSuara;
    this.sahSuara = sahSuara ?? this.sahSuara;
    this.tidaksahSuara = tidaksahSuara ?? this.tidaksahSuara;
  }
}