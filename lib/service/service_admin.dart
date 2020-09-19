part of 'service.dart';


class AdminService {
  final fire_store.CollectionReference _userCollection = fire_store.FirebaseFirestore
    .instance.collection('user'); 

  Future<void> createAdmin(Admin admin) async {
    await _userCollection.doc(admin.id).set({
      'email': admin.email,
    });
  }

  Future<void> updateAdmin(String id, {String email, String name, String photoURL, 
  List<String> favGenres, List<String> favCountries}) async {
    
    final Map<String, dynamic> data = {};

    if (email != null) {
      data['email'] = email;
    }
    if (name != null) {
      data['name'] = name;
    }
    if (favGenres != null) {
      data['favoriteGenre'] = favGenres.join(',');
    }
    if (favCountries != null) {
      data['favoriteCountry'] = favCountries.join(',');
    }
    
    await _userCollection.doc(id).update(data);
  }

  Future<Admin> getAdmin(String id) async {
    final fire_store.DocumentSnapshot snapshot = await _userCollection.doc(id).get();

    return Admin(
      id,
      snapshot.data()["email"] as String,
    );
  }
}