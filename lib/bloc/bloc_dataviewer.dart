part of 'bloc.dart';


class DataViewerBloc implements Bloc {
  
  final List<Calon> _calons = [
    Calon('1', 'Eky'),
    Calon('2', 'Rizky'),
  ];
  List<Calon> get calons => _calons; 
  
  @override
  void dispose() {}

  @override
  void init() {}

}