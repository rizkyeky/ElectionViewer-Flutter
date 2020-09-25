part of 'service.dart';

class UserService {

  TypeUser type;
  fire_store.CollectionReference _userCollection;

  UserService(this.type) {
    String strType = '';
    if (type == TypeUser.admin) {
      strType = 'admin';
    } else {
      strType = 'pemantau';
    }
    _userCollection = fire_store.FirebaseFirestore.instance.collection(strType); 
  }

  factory UserService.admin() => UserService(TypeUser.admin);
  factory UserService.pemantau() => UserService(TypeUser.pemantau);

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
    final Map<String, dynamic> data = {
      'nama': user.name,
      'email': user.email,
    };
    
    if (type == TypeUser.pemantau) {
      data['hak_input'] = (user as Pemantau).hakInput; 
    }

    await _userCollection.doc(user.id).set(data);
  }

  Future<void> updateUser(String id, {String name, String email, bool hakInput, Map<String, String> tempat}) async {
    
    final Map<String, dynamic> data = {};

    if (name != null) {
      data['nama'] = name;
    }
    if (email != null) {
      data['email'] = email;
    }
    if (hakInput != null && type == TypeUser.pemantau) {
      data['hak_input'] = hakInput;
    }
    if (tempat != null && type == TypeUser.pemantau) {
      data['kecamatan'] = tempat['kecamatan'];
      data['kelurahan'] = tempat['kelurahan'];
      data['tps'] = tempat['tps'];
    }
    
    await _userCollection.doc(id).update(data);
  }

  Future<User> getUser(String id) async {
    final fire_store.DocumentSnapshot snapshot = await _userCollection.doc(id).get();

    if (type == TypeUser.admin) {
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
        hakInput: snapshot.data()["hak_input"] as bool
      );
    }
  }
}