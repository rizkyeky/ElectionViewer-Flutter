part of 'model.dart';

class Calon {
  String id;
  String name;
  int number;
  int suara;
  String photoURL;

  Calon(this.id, this.name, this.number, {this.suara = 0, this.photoURL = ''});
  factory Calon.initial() => Calon('', '', 0);
}