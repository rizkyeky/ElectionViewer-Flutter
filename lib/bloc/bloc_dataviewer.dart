part of 'bloc.dart';

class DataViewerBloc implements Bloc {

  // final CalonService _calonService = locator
  //   .get<CalonService>(instanceName: 'Service Calon');
  
  final List<Calon> _calons = [];
  List<Calon> get calons => _calons; 
  
  @override
  void dispose() {}

  @override
  void init() {}

  Future<List<Calon>> getCalons() async {
    await Future.delayed( const Duration(seconds: 2)).whenComplete(() {
      _calons.addAll([
        Calon('1', 'Junaidi', 1,
          totalSuara: 300,
          sahSuara: 250,
          tidaksahSuara: 50,
        ),
        Calon('2', 'Rendi', 2,
          totalSuara: 500,
          sahSuara: 250,
          tidaksahSuara: 250,
        ),
        Calon('3', 'Firdi', 3,
          totalSuara: 400,
          sahSuara: 300,
          tidaksahSuara: 100,
        ),
      ]);
    });
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