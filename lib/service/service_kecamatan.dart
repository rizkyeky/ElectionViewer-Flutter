part of 'service.dart';

class KecamatanService {
  final http.Client _client = http.Client();
  final String _homeBase = 'dev.farizdotid.com';
  
  Future<List<Kecamatan>> getKecamatans() async {
    try {
      const String _subBase = 'api/daerahindonesia/kecamatan';

      final Uri _uri = Uri.https(_homeBase, _subBase, {'id_kota': '7271'});
      final http.Response response = await _client.get(_uri)
        .timeout(const Duration(seconds: 10));

      if (response.statusCode != 200) {
        // Respone not success
        return [];
      }
      else {
        // Respone success
        final Map data = json.decode(response.body) as Map;
        final List result = data['kecamatan'] as List;
        
        // print('respone success');
        // print(result);
        
        return result.map<Kecamatan>((e) => Kecamatan
          .fromJson(e as Map<String, dynamic>)).toList();
      }
    } catch (e) {
      print('request was failed');
      return [];
    }
  }
}