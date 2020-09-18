part of 'model.dart';

class User{
  String id;
  String name;
  String email;
  String photoURL;
  List<String> favoriteGenre; 
  List<String> favoriteCountry;
  List<String> favoriteMovie;

  User(this.id, this.name, this.email,
  this.photoURL, this.favoriteGenre, this.favoriteCountry, this.favoriteMovie);

  factory User.initial() => User(
    '','','','',[],[],[]
  );

  @override
  String toString() => '$id - $name, $email, $favoriteGenre, $favoriteCountry';

  void copyWith({
    String id,
    String name,
    String email,
    String photoURL, 
    List<String> favoriteGenre,
    List<String> favoriteCountry,
    List<String> favoriteMovie
  }) {
    this.id = id ?? this.id;
    this.name = name ?? this.name;
    this.email = email ?? this.email;
    this.photoURL = photoURL ?? this.photoURL;
    this.favoriteGenre = favoriteGenre ?? this.favoriteGenre;
    this.favoriteCountry = favoriteCountry ?? this.favoriteCountry;
    this.favoriteMovie = favoriteMovie ?? this.favoriteMovie;
  }

  void duplicate(User user) {
    id = user.id;
    name = user.name;
    email = user.email;
    photoURL = user.photoURL;
    favoriteGenre = user.favoriteGenre;
    favoriteCountry = user.favoriteCountry;
    favoriteMovie = user.favoriteMovie;
  }
}