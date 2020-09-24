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

  Future<List<Calon>> getCalons() async {
    final fire_store.QuerySnapshot snapshot = await _calonCollection.get();
    
    final List<Calon> data = snapshot.docs.map((e) => Calon(
      e.id,
      e.data()["nama"] as String,
      (e.data()["nomor"] as num).toInt(),
      suara: (e.data()["suara"] as num).toInt(),
      photoURL: e.data()["photoURL"] as String,
    )).toList();

    data.sort((calon1, calon2) => calon1.number.compareTo(calon2.number));
    return data;
  }

  Future<Calon> getCalon(String id) async {
    final fire_store.DocumentSnapshot snapshot = await _calonCollection
      .doc(id).get();
    
    return Calon(
      id,
      snapshot.data()["nama"] as String,
      (snapshot.data()["nomor"] as num).toInt(),
      suara: (snapshot.data()["suara"] as num).toInt(),
      photoURL: snapshot.data()["photoURL"] as String,
    );
  }
}