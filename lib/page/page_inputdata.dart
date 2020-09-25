part of 'page.dart';

class InputDataPage extends Page<InputDataBloc> {

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void init() {
    // TODO: implement init
  }

  Widget buildInputBox(BuildContext context, Calon calon, int index) {
    return XBox(
      borderColor: borderColor,
      padding: const EdgeInsets.all(15),
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Calon ${calon.number}', style: blackSubtitleBold,),
                  Text(calon.name, style: blackSubtitleRegular,),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Total Suara', style: blackContentRegular,),
                  StreamBuilder<List<int>>(
                    initialData: List.generate(bloc.calons.length, (index) => 0),
                    stream: bloc.streamCountSuara,
                    builder: (context, snapshotStream) => 
                      Text(convertCurr(snapshotStream.data[index]), 
                        style: blackNumber,)
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              XTextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  bloc.inputSahSuara(index, int.parse(value));
                },
                text: 'Suara Sah',
              ),
              const SizedBox(height: 15,),
              XTextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  bloc.inputTidakSahSuara(index, int.parse(value));
                },
                text: 'Suara Tidak Sah',
              ),
            ],
          )
        ],
      )
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: XTopBar(
        textTitle: 'Input Data',
        isLoading: true,
        isLoadingStream: bloc.isLoadingStream,
      ),
      body: FutureBuilder<List<Calon>>(
        future: bloc.getCalons(),
        builder: (context, snapshot) => (snapshot.hasData) ? SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: List<Widget>.generate(snapshot.data.length, (index) => 
              buildInputBox(context, snapshot.data[index], index))
            ),
          ) : const Center(child: CircularProgressIndicator(),)
      ),
      floatingActionButton: Builder(
        builder: (context) => FloatingActionButton.extended(
          backgroundColor: mainColor,
          onPressed: () async{
            if (bloc.hakInputPemantau) {
              await bloc.sendSuara();
            } else {
              Scaffold.of(context).showSnackBar(snackBar(
                contentText: 'Pemantau sudah mengirim suara',
                labelText: 'TUTUP',
                onPressed: () => Scaffold.of(context).hideCurrentSnackBar()
              ));
            }
          }, 
          label: Text('Kirim', style: whiteSubtitleBold,),
          elevation: 0,
          highlightElevation: 0,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}