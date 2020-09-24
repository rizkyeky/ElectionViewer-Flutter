part of 'bloc.dart';


class DataViewerBloc implements Bloc {
  
  final List<Calon> _calons = [
    Calon('1', 'Eky', 1),
    Calon('2', 'Rizky', 2),
  ];
  List<Calon> get calons => _calons; 
  
  @override
  void dispose() {}

  @override
  void init() {}

}