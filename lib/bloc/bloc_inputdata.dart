part of 'bloc.dart';

class InputDataBloc implements Bloc {

  final CalonService _calonService = locator
    .get<CalonService>(instanceName: 'Service Calon');
  final SuaraService _suaraService = locator
    .get<SuaraService>(instanceName: 'Service Suara');

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
    return _calonService.getCalon(_calons[index].id).asStream()
      .map((event) => event.suara); 
  }
}