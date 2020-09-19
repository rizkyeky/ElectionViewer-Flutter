part of 'page.dart';

class PemilihanTempatPage extends Page<PemilihanTempatBloc> {

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void init() {
    // TODO: implement init
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: XTopBar(
        textTitle: 'Pemilihan Tempat',
      ),
      body: SafeArea(
        child: Container(
          height: 400,
          margin: paddingPage,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Kelurahan', style: blackContentRegular),
              XDropDown(
                length: bloc.kelurahan.length,
                childBuilder: (context, index) => Text(bloc.kelurahan[index], 
                  style: blackContentRegular,
                )
              ),
              const SizedBox(height: 30,),
              Text('Kecamatan', style: blackContentRegular),
              XDropDown(
                length: bloc.kecamatan.length,
                childBuilder: (context, index) => Text(bloc.kecamatan[index], 
                  style: blackContentRegular,
                )
              ),
              const SizedBox(height: 30,),
              Text('Tempat TPS', style: blackContentRegular),
              XDropDown(
                length: bloc.tps.length,
                childBuilder: (context, index) => Text(bloc.tps[index], 
                  style: blackContentRegular,
                )
              )
            ] 
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: mainColor,
        onPressed: () {}, 
        label: Text('Selesai', style: whiteSubtitleBold,),
        elevation: 0,
        highlightElevation: 0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
