part of 'service.dart';


class CalonService {
  final fire_store.CollectionReference _calonCollection = fire_store.FirebaseFirestore
    .instance.collection('calon'); 

  Future<void> createCalon(Calon calon) async {
    await _calonCollection.doc(calon.id).set({
      'nama': calon.nama,
      'nomor': calon.nomor,
      'suara': calon.suara,
    });
  }

  Future<void> updateCalon(String id, {String email, String nama, String photoURL, 
  int suara}) async {
    
    final Map<String, dynamic> data = {};

    if (email != null) {
      data['email'] = email;
    }
    if (nama != null) {
      data['nama'] = nama;
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