part of 'bloc.dart';

class InputDataBloc implements Bloc {

  final BehaviorSubject<List<int>> _countSuaraController = BehaviorSubject();
  Stream<List<int>> get streamCountSuara => _countSuaraController.stream;

  final BehaviorSubject<bool> _loadingController = BehaviorSubject();
  Stream<bool> get isLoadingStream => _loadingController.stream;

  // final CalonService _calonService = locator
  //   .get<CalonService>(instanceName: 'Service Calon');
  
  final List<Calon> _calons = [];
  List<Calon> get calons => _calons;

  final List<Map<String, int>> _inputSuaraCalons = [{}];
  final List<bool> _isInputed = [];
  bool get isInputed => _isInputed.every((element) => element == true);

  @override
  void dispose() {
    _countSuaraController.close();
    _loadingController.close();
  }

  @override
  Future<void> init() async {}

  Future<List<Calon>> getCalons() async {

    await Future.delayed( const Duration(seconds: 2))
      .whenComplete(() => _calons.addAll([
        Calon('1', 'Junaidi', 1,),
        Calon('2', 'Rendi', 2,),
        Calon('3', 'Firdi', 3,),
      ]))
      .whenComplete(() {
        
        _countSuaraController.sink.add(
          List.generate(_calons.length, (index) => 0)
        );

        for (int i = 0; i < _calons.length; i++) {
          _inputSuaraCalons.add({
            'total_suara': 0,
            'suara_sah': 0,
            'suara_tidak_sah': 0
          });
          _isInputed.add(false);
        }

      });
    
    return _calons;
  }

  Future<Calon> getCalon(int index) async {
    return _calons[index];
  }

  void inputSahSuara(int index, int value) {
    _inputSuaraCalons[index]['suara_sah'] = value;

    if (!_inputSuaraCalons[index].containsKey('suara_tidak_sah')) {
      _inputSuaraCalons[index]['suara_tidak_sah'] = 0;  
    }
    
    _inputSuaraCalons[index]['total_suara'] = 
    _inputSuaraCalons[index]['suara_sah'] + _inputSuaraCalons[index]['suara_tidak_sah']; 

    _isInputed[index] = _inputSuaraCalons[index]['total_suara'] > 0;
    
    _countSuaraController.sink.add(
      List.generate(_calons.length, (index) => 
      _inputSuaraCalons[index]['total_suara'])
    );
  }

  void inputTidakSahSuara(int index, int value) {
    _inputSuaraCalons[index]['suara_tidak_sah'] = value;
   
    if (!_inputSuaraCalons[index].containsKey('suara_sah')) {
      _inputSuaraCalons[index]['suara_sah'] = 0;  
    }

    _inputSuaraCalons[index]['total_suara'] = 
    _inputSuaraCalons[index]['suara_sah'] + _inputSuaraCalons[index]['suara_tidak_sah'];

    _isInputed[index] = _inputSuaraCalons[index]['total_suara'] > 0; 

    _countSuaraController.sink.add(
      List.generate(_calons.length, (index) => 
      _inputSuaraCalons[index]['total_suara'])
    );
  }

  Future<void> sendSuara() async {
    _loadingController.sink.add(true);
    
    // for (int i = 0; i < _calons.length; i++) {
    //   await _calonService.updateCalon(calons[i].id,
    //     totalSuara: _inputSuaraCalons[i]['total_suara'], 
    //     tidaksahSuara: _inputSuaraCalons[i]['suara_tidak_sah'],
    //     sahSuara: _inputSuaraCalons[i]['suara_sah']
    //   );
    // }

    // locator.call<Pemantau>(instanceName: 'Pemantau Active').copyWith(hakInput: false);
    // final Pemantau pemantau = locator.get<Pemantau>(instanceName: 'Pemantau Active');  
    // locator.get<UserService>(instanceName: 'Service Pemantau')
    // .updateUser(pemantau.id, hakInput: pemantau.hakInput, tempat: pemantau.tempat);
    Future.delayed( const Duration(seconds: 2));
    _loadingController.sink.add(false);
  }

  bool get hakInputPemantau => locator
    .get<Pemantau>(instanceName: 'Pemantau Active').hakInput;
}