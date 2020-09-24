part of 'service.dart';

class SuaraService {
  final fire_store.CollectionReference _suaraCollection = fire_store.FirebaseFirestore
    .instance.collection('suara');

  final docID = '6Adna3m0x8GaTm95UJ1M'; 

  Future<void> setSuara({int suaraSah, int suaraTidakSah}) async {
    
    final Map<String, dynamic> data = {};

    if (suaraSah != null) {
      data['suara_sah'] = suaraSah;
    }
    if (suaraTidakSah != null) {
      data['suara_tidak_sah'] = suaraTidakSah;
    }

    await _suaraCollection.doc(docID).update(data);
  }

  Stream<Map<String, int>> getSuara() {
    return _suaraCollection.doc(docID).snapshots().map((element) {
      final Map<String, int> data = {};
      data['suara_sah'] = (element.data()['suara_sah'] as num).toInt();
      data['suara_tidak_sah'] = (element.data()['suara_tidak_sah'] as num).toInt();
      return data;
    });
  }
}