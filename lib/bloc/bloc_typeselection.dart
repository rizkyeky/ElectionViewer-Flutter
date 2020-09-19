part of 'bloc.dart';

class TypeSelectionBloc implements Bloc {
  
  Map<int, List<String>> _types = {
    0: ['Pemantau TPS', '/pemantaulogin'],
    1: ['Admin', '/adminlogin']
  };
  Map<int, List<String>> get types => _types;


  @override
  void init() {}

  @override
  void dispose() {}


}