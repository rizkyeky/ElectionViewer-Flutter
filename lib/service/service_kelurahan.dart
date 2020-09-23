part of 'service.dart';

class KelurahanService {
  final http.Client _client = http.Client();
  final String _homeBase = 'dev.farizdotid.com';
  
  Future<List<Kelurahan>> getKelurahans(int idKecamatan) async {
    try {
      const String _subBase = 'api/daerahindonesia/kelurahan';

      final Uri _uri = Uri
        .https(_homeBase, _subBase, {'id_kecamatan': idKecamatan.toString()});
      final http.Response response = await _client.get(_uri)
        .timeout(const Duration(seconds: 10));

      if (response.statusCode != 200) {
        // Respone not success
        return [];
      }
      else {
        // Respone success
        final Map data = json.decode(response.body) as Map;
        final List result = data['kelurahan'] as List;
        
        return result.map<Kelurahan>((e) => Kelurahan
          .fromJson(e as Map<String, dynamic>)).toList();
      }
    } catch (e) {
      // print('request was failed');
      return [];
    }
  }
}