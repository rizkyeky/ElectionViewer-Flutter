part of 'model.dart';

class Calon {
  String id;
  String name;
  int number;
  int suara;
  String photoURL;

  Calon(this.id, this.name) {
    number = 0;
    suara = 2000;
    photoURL = '';
  }

  factory Calon.initial() => Calon('', '');
}