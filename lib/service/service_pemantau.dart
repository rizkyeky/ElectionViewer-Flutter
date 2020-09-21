part of 'service.dart';

class PemantauService {
  final fire_store.CollectionReference _userCollection = fire_store.FirebaseFirestore
    .instance.collection('user'); 

  Future<Pemantau> setPemantau(Pemantau user) async {

    await _userCollection.doc(user.id).set({
      'email': user.email,
      'nama': user.nama,
    });

    return user;
  }

  Future<void> updatePemantau(String id, {String email, String nama}) async {
    
    final Map<String, dynamic> data = {};

    if (email != null) {
      data['email'] = email;
    }
    if (nama != null) {
      data['nama'] = nama;
    }
    
    await _userCollection.doc(id).update(data);
  }

  Future<Pemantau> getPemantau(String id) async {
    final fire_store.DocumentSnapshot snapshot = await _userCollection.doc(id).get();

    return Pemantau(
      id,
      snapshot.data()["name"] as String,
      snapshot.data()["email"] as String,
    );
  }
}