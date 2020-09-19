part of 'page.dart';

class TypeSelectionPage extends Page<TypeSelectionBloc> {

  @override
  void dispose() {}

  @override
  void init() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: XTopBar(
        textTitle: 'Masuk',
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            XButton(
              height: 60,
              width: 200,
              color: mainColor,
              onTap: () => Navigator
                .pushReplacementNamed(context, '/loginpemantau'), 
              child: Text('Sebagai\nPemantau TPS', 
                style: whiteSubtitleBold,
                textAlign: TextAlign.center,
              )
            ),
            SizedBox(height: 30,),
            XButton(
              height: 50,
              width: 200,
              isBorder: true,
              onTap: () => Navigator
                .pushReplacementNamed(context, '/loginadmin'), 
              child: Text('Sebagai Admin', 
                style: blackSubtitleBold, 
              )
            ),
          ] 
        ),
      ),
    );
  }
}