part of 'page.dart';

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
          children: [
            FlatButton(
              color: mainColor,
              onPressed: () => Navigator
                .pushReplacementNamed(context, '/pemantaulogin'), 
              child: Text('Sebagai Pemantau TPS', style: whiteSubtitleRegular,)
            ),
            FlatButton(
              shape: Border.all(color: greyColor),
              onPressed: () => Navigator
                .pushReplacementNamed(context, '/adminlogin'), 
              child: Text('Sebagai Admin', style: blackSubtitleRegular,)
            ),
          ] 
        ),
      ),
    );
  }
}