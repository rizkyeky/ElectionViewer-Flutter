part of 'page.dart';

class PemilihanTempatPage extends Page<PemilihanTempatBloc> {

  @override
  void dispose() {}

  @override
  void init() {}
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: XTopBar(
        textTitle: 'Pemilihan Tempat',
        isLoading: true,
        isLoadingStream: bloc.isLoadingStream,
      ),
      body: SafeArea(
        child: Container(
          height: 400,
          margin: paddingPage,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Kecamatan', style: blackContentRegular),
              StreamBuilder<Map<String, List>>(
                initialData: const {'kecamatan': []},
                stream: bloc.pemilihanStream,
                builder: (context, snapshot) {
                  return (snapshot.hasData) ? XDropDown(
                  isDisabled: bloc.kecamatans.isEmpty,
                  onSelected: (index) async {
                    bloc.selectTempat(indexKec: index);
                    await bloc.getKelurahans((snapshot.data['kecamatan'][index] as Kecamatan).id);
                  },
                  length: bloc.kecamatans.length ,
                  childrenBuilder: (context, index) => 
                    Text((snapshot.data['kecamatan'][index] as Kecamatan).name, 
                      style: blackContentRegular,
                    )
                ) : const SizedBox(height: 50,);
                }
              ),
              const SizedBox(height: 30,),
              Text('Kelurahan', style: blackContentRegular),
              StreamBuilder<Map<String, List>>(
                initialData: const {'kelurahan': []},
                stream: bloc.pemilihanStream,
                builder: (context, snapshot) {
                  return (snapshot.hasData) ? XDropDown(
                  onSelected: (index) {
                    bloc.selectTempat(indexKel: index);
                    bloc.generateTPSes();
                  },
                  isDisabled: bloc.kelurahans.isEmpty,
                  length: bloc.kelurahans.length,
                  childrenBuilder: (context, index) => 
                    Text((snapshot.data['kelurahan'][index] as Kelurahan).name, 
                      style: blackContentRegular,
                    )
                ) : const SizedBox(height: 50,);
                }
              ),
              const SizedBox(height: 30,),
              Text('Tempat TPS', style: blackContentRegular),
              StreamBuilder<Map<String, List>>(
                initialData: const {'tps': []},
                stream: bloc.pemilihanStream,
                builder: (context, snapshot) => (snapshot.hasData) ? XDropDown(
                  onSelected: (index) {
                    bloc.selectTempat(indexTPS: index);
                  },
                  isDisabled: bloc.tpses.isEmpty,
                  length: bloc.tpses.length,
                  childrenBuilder: (context, index) => 
                    Text(snapshot.data['tps'][index] as String, 
                      style: blackContentRegular,
                    )
                ) : const SizedBox(height: 50,)
              ) 
            ] 
          ),
        ),
      ),
      floatingActionButton: Builder(
        builder: (context) => FloatingActionButton.extended(
          backgroundColor: mainColor,
          onPressed: () {
            if (bloc.selectedTempat.keys.length == 3) {
              Navigator.pushReplacementNamed(context, '/inputdata');
            } else {
              
              String tempat = '';
              if (!bloc.selectedTempat.keys.contains('kecamatan')) {
                tempat = 'kecamatan';
              } else if (!bloc.selectedTempat.keys.contains('kelurahan')) {
                tempat = 'kelurahan';
              } else if (!bloc.selectedTempat.keys.contains('tps')) {
                tempat = 'TPS';
              }

              Scaffold.of(context).showSnackBar(snackBar(
                contentText: 'Pilih $tempat',
                labelText: 'TUTUP',
                onPressed: () => Scaffold.of(context).hideCurrentSnackBar()
              ));
            }
          }, 
          label: Text('Selesai', style: whiteSubtitleBold,),
          elevation: 0,
          highlightElevation: 0,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
