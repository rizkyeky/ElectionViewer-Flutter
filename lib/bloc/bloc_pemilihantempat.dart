part of 'bloc.dart';

class PemilihanTempatBloc implements Bloc {

  final List<String> _kecamatan = List.generate(5, (index) => 'Kec$index');
  List<String> get kecamatan => _kecamatan;

  final List<String> _kelurahan = List.generate(5, (index) => 'Kel$index');
  List<String> get kelurahan => _kelurahan;

  final List<String> _tps = List.generate(5, (index) => 'TPS$index');
  List<String> get tps => _tps;

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void init() {
    // TODO: implement init
  }

}