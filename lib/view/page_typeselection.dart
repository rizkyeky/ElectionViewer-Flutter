part of 'view.dart';

class TypeSelectionPage extends Page<TypeSelectionBloc> {

  @override
  void dispose() {}

  @override
  void init() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Masuk'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(2, (index) => FlatButton(
            onPressed: () => Navigator
              .pushReplacementNamed(context, bloc.types[index][1]), 
            child: Text(bloc.types[index][0], style: blackTitle,)
          )),
        ),
      ),
    );
  }
}