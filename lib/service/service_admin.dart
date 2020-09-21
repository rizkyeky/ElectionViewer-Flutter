part of 'service.dart';

class AdminService {
  final fire_store.CollectionReference _userCollection = fire_store.FirebaseFirestore
    .instance.collection('user'); 

  Future<void> createAdmin(Admin admin) async {
    await _userCollection.doc(admin.id).set({
      'email': admin.email,
      'nama': admin.nama,
    });
  }

  Future<void> updateAdmin(String id, {String email, String nama}) async {
    
    final Map<String, dynamic> data = {};

    if (email != null) {
      data['email'] = email;
    }
    if (nama != null) {
      data['name'] = nama;
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