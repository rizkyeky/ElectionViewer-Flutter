part of 'bloc.dart';

class DataViewerBloc implements Bloc {

  final CalonService _calonService = locator
    .get<CalonService>(instanceName: 'Service Calon');
  
  final List<Calon> _calons = [];
  List<Calon> get calons => _calons; 
  
  @override
  void dispose() {}

  @override
  void init() {}

  Future<List<Calon>> getCalons() async {
    _calons.addAll(await _calonService.getCalons(encrypt: false));
    return _calons;
  }

  int totalSuara() {
    int temp = 0;
    for (final Calon calon in _calons) {
      temp += calon.totalSuara;
    }
    return temp;
  }

  int totalSuaraSah() {
    int temp = 0;
    for (final Calon calon in _calons) {
      temp += calon.sahSuara;
    }
    return temp;
  }

  int totalSuaraTidakSah() {
    int temp = 0;
    for (final Calon calon in _calons) {
      temp += calon.tidaksahSuara;
    }
    return temp;
  }

}