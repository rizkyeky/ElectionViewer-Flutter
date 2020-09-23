part of 'service.dart';


class CalonService {
  final fire_store.CollectionReference _calonCollection = fire_store.FirebaseFirestore
    .instance.collection('calon'); 

  Future<void> createCalon(Calon calon) async {
    await _calonCollection.doc(calon.id).set({
      'nama': calon.name,
      'nomor': calon.number,
      'suara': calon.suara,
    });
  }

  Future<void> updateCalon(String id, {String email, String name, String photoURL, 
  int suara}) async {
    
    final Map<String, dynamic> data = {};

    if (email != null) {
      data['email'] = email;
    }
    if (name != null) {
      data['nama'] = name;
    }
    if (suara != null) {
      data['suara'] = suara;
    }
    
    await _calonCollection.doc(id).update(data);
  }

  Future<Calon> getCalon(String id) async {
    final fire_store.DocumentSnapshot snapshot = await _calonCollection.doc(id).get();

    return Calon(
      id,
      snapshot.data()["nama"] as String,
    );
  }
}