part of 'page.dart';

class TypeSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 400,
          margin: paddingPage,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Enter', style: blackTitle,),
              const SizedBox(height: 30,),
              XButton(
                height: 60,
                color: mainColor,
                onTap: () => Navigator.pushNamed(context, '/loginpemantau'), 
                child: Text('As Monitor', 
                  style: whiteSubtitleBold,
                  textAlign: TextAlign.center,
                )
              ),
              const SizedBox(height: 30,),
              XButton(
                height: 60,
                isBorder: true,
                onTap: () => Navigator.pushNamed(context, '/loginadmin'), 
                child: Text('As Admin', 
                  style: blueSubtitleBold.copyWith(color: greyColor), 
                )
              ),
            ] 
          ),
        ),
      ),
    );
  }
}