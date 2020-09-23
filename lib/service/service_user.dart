part of 'service.dart';

class UserService {

  String type;
  fire_store.CollectionReference _userCollection;

  UserService(this.type) {
    _userCollection = fire_store.FirebaseFirestore.instance.collection(type); 
  }

  factory UserService.admin() => UserService('admin');
  factory UserService.pemantau() => UserService('pemantau');

  static Future<TypeUser> findType(String id) async {

    final fire_store.CollectionReference _adminCollection = fire_store
      .FirebaseFirestore.instance.collection('admin');
    final fire_store.CollectionReference _pemantauCollection = fire_store
      .FirebaseFirestore.instance.collection('pemantau');

    final fire_store.QuerySnapshot snapshotAdmin = await _adminCollection.get();
    final fire_store.QuerySnapshot snapshotPemantau = await _pemantauCollection.get();

    final documentsAdmin = snapshotAdmin.docs
      .where((document) => document.id == id);
    
    final documentsPemantau = snapshotPemantau.docs
      .where((document) => document.id == id);

    if (documentsAdmin.isNotEmpty) {
      return TypeUser.admin;
    } else if (documentsPemantau.isNotEmpty) {
      return TypeUser.pemantau;
    } else {
      return null;
    }
  }

  Future<void> createUser(User user) async {
    await _userCollection.doc(user.id).set({
      'nama': user.name,
      'email': user.email,
    });
  }

  Future<void> updateUser(String id, {String name, String email,}) async {
    
    final Map<String, dynamic> data = {};

    if (name != null) {
      data['nama'] = name;
    }
    if (email != null) {
      data['email'] = email;
    }
    
    await _userCollection.doc(id).update(data);
  }

  Future<User> getUser(String id) async {
    final fire_store.DocumentSnapshot snapshot = await _userCollection.doc(id).get();

    if (type == 'admin') {
      return Admin(
        id,
        snapshot.data()["nama"] as String,
        snapshot.data()["email"] as String,
      );
    } else {
      return Pemantau(
        id,
        snapshot.data()["nama"] as String,
        snapshot.data()["email"] as String,
      );
    }
  }
}