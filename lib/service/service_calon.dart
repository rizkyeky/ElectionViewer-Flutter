part of 'service.dart';


class CalonService {
  final fire_store.CollectionReference _calonCollection = fire_store.FirebaseFirestore
    .instance.collection('calon'); 

  Future<void> createCalon(Calon calon) async {
    await _calonCollection.doc(calon.id).set({
      'nama': calon.name,
      'nomor': calon.number,
      'total_suara': calon.totalSuara,
      'suara_sah': calon.sahSuara,
      'suara_tidak_sah': calon.tidaksahSuara
    });
  }

  Future<void> updateCalon(String id, {String email, String name, String photoURL, 
  int totalSuara, int sahSuara, int tidaksahSuara}) async {

    final fire_store.DocumentSnapshot snapshot = await _calonCollection
      .doc(id).get();
    
    final Map<String, dynamic> data = {};

    if (email != null) {
      data['email'] = email;
    }
    if (name != null) {
      data['nama'] = name;
    }
    if (totalSuara != null) {
      data['total_suara'] = totalSuara + (snapshot.data()['total_suara'] as num).toInt();
    }
    if (sahSuara != null) {
      data['suara_sah'] = sahSuara + (snapshot.data()['suara_sah'] as num).toInt();
    }
    if (tidaksahSuara != null) {
      data['suara_tidak_sah'] = tidaksahSuara  + (snapshot.data()['suara_tidak_sah'] as num).toInt();
    }
    
    await _calonCollection.doc(id).update(data);
  }

  Future<List<Calon>> getCalons() async {
    final fire_store.QuerySnapshot snapshot = await _calonCollection.get();
    
    final List<Calon> data = snapshot.docs.map((e) => Calon(
      e.id,
      e.data()["nama"] as String,
      (e.data()["nomor"] as num).toInt(),
      totalSuara: (e.data()["total_suara"] as num).toInt(),
      sahSuara: (e.data()["suara_sah"] as num).toInt(),
      tidaksahSuara: (e.data()["suara_tidak_sah"] as num).toInt(),
      photoURL: e.data()["photoURL"] as String,
    )).toList();

    return data;
  }

  Future<Calon> getCalon(String id) async {
    final fire_store.DocumentSnapshot snapshot = await _calonCollection
      .doc(id).get();
    
    return Calon(
      id,
      snapshot.data()["nama"] as String,
      (snapshot.data()["nomor"] as num).toInt(),
      totalSuara: (snapshot.data()["total_suara"] as num).toInt(),
      sahSuara: (snapshot.data()["suara_sah"] as num).toInt(),
      tidaksahSuara: (snapshot.data()["suara_tidak_sah"] as num).toInt(),
      photoURL: snapshot.data()["photoURL"] as String,
    );
  }

  Stream<int> streamSuaraCalon(String id)  {
    return _calonCollection.doc(id).snapshots()
      .map((event) => (event.data()['total_suara'] as num).toInt());
  }
}