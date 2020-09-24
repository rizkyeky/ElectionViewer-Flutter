part of 'bloc.dart';

class InputDataBloc implements Bloc {

  final CalonService _calonService = locator
    .get<CalonService>(instanceName: 'Service Calon');
  // final SuaraService _suaraService = locator
  //   .get<SuaraService>(instanceName: 'Service Suara');

  final List<Calon> _calons = [];
  List<Calon> get calons => _calons;

  @override
  void dispose() {}

  @override
  Future<void> init() async {
    // await getCalons();
  }

  Future<Calon> getCalon(int index) async {
    _calons.addAll(await _calonService.getCalons());
    return _calons[index];
  }

  Stream<int> getSuaraCalon(int index) {
    return _calonService.streamSuaraCalon(_calons[index].id); 
  }

  void inputSahSuara(int index, int value) {
    _calons[index].copyWith(sahSuara: value);
  }

  void inputTidakSahSuara(int index, int value) {
    _calons[index].copyWith(tidaksahSuara: value);
  }

  void sendSuara() {
    for (final Calon calon in _calons) {
      _calonService.updateCalon(calon.id,
        totalSuara: calon.sahSuara + calon.tidaksahSuara, 
        tidaksahSuara: calon.tidaksahSuara,
        sahSuara: calon.sahSuara
      );
    }
  }
}