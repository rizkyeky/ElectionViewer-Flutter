part of 'page.dart';

class InputDataPage extends Page<InputDataBloc> {

  @override
  void dispose() {}

  @override
  void init() {}

  Widget buildInputBox(BuildContext context, Calon calon, int index) {
    return XBox(
      borderColor: borderColor,
      padding: const EdgeInsets.all(15),
      height: 200,
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
                  Text('Candidate ${calon.number}', style: blackSubtitleBold,),
                  Text(calon.name, style: blackSubtitleRegular,),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Total Votes', style: blackContentRegular,),
                  StreamBuilder<List<int>>(
                    initialData: List.generate(_bloc.calons.length, (index) => 0),
                    stream: _bloc.streamCountSuara,
                    builder: (context, snapshotStream) => 
                      Text(snapshotStream.data[index].toString(), 
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
                  _bloc.inputSahSuara(index, int.parse(value));
                },
                text: 'Valid Votes',
              ),
              const SizedBox(height: 15,),
              XTextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  _bloc.inputTidakSahSuara(index, int.parse(value));
                },
                text: 'Invalid Votes',
              ),
            ],
          )
        ],
      )
    );
  }
  
  @override
  Widget build(BuildContext context) {

    List<Widget> list(int len, List<Calon> data) {
      final List<Widget> list = List<Widget>.generate(len, (index) => 
        buildInputBox(context, data[index], index));
      list.add(const SizedBox(height: 15,));     
      list.add(Text('Pemantau hanya dapat memasukan data pilkada sekali. Perhatikan kembali data yang dimasukan.',
        style: blackContentBold,
        textAlign: TextAlign.center,
      ));
      list.add(const SizedBox(height: 50,));     
      return list;
    }
    
    return Scaffold(
      appBar: XTopBar(
        textTitle: 'Input Data',
        isLoading: true,
        isLoadingStream: _bloc.isLoadingStream,
      ),
      body: FutureBuilder<List<Calon>>(
        future: _bloc.getCalons(),
        builder: (context, snapshot) => (snapshot.hasData) ? SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: list(snapshot.data.length, snapshot.data)
            ),
          ) : const Center(child: CircularProgressIndicator(),)
      ),
      floatingActionButton: Builder(
        builder: (context) => FloatingActionButton.extended(
          backgroundColor: mainColor,
          onPressed: () async {
            if (_bloc.hakInputPemantau && _bloc.isInputed) {
              await _bloc.sendSuara().whenComplete(() => 
                Navigator.pushNamedAndRemoveUntil(context, '/', (router) => false));
            } else if (!_bloc.isInputed) {
              Scaffold.of(context).showSnackBar(snackBar(
                contentText: 'Invalid data',
                labelText: 'DISMISS',
                onPressed: () => Scaffold.of(context).hideCurrentSnackBar()
              ));
            } else if (!_bloc.hakInputPemantau) {
              Scaffold.of(context).showSnackBar(snackBar(
                contentText: 'Done',
                labelText: 'DISMISS',
                onPressed: () => Scaffold.of(context).hideCurrentSnackBar()
              ));
            }
          }, 
          label: Text('Send', style: whiteSubtitleBold,),
          elevation: 0,
          highlightElevation: 0,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}