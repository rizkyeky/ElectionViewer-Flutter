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

  Widget buildInputBox(BuildContext context, int index) {
    return XBox(
      borderColor: borderColor,
      padding: const EdgeInsets.all(15),
      height: 250,
      child: FutureBuilder<Calon>(
        future: bloc.getCalon(index),
        builder: (context, snapshotFuture) => (snapshotFuture.hasData) ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Calon $index', style: blackSubtitleBold,),
                      Text('Rizky', style: blackSubtitleRegular,),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('Total Suara', style: blackContentRegular,),
                      StreamBuilder<int>(
                        initialData: snapshotFuture.data.suara,
                        stream: bloc.getSuaraCalon(index),
                        builder: (context, snapshotStream) {
                          return Text(convertCurr(snapshotStream.data), style: blackNumber,);
                        }
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  XTextField(
                    text: 'Suara Sah',
                  ),
                  const SizedBox(height: 15,),
                  XTextField(
                    text: 'Suara Tidak Sah',
                  ),
                ],
              )
            ],
          ) : const Center(child: CircularProgressIndicator(),)
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: XTopBar(
        textTitle: 'Input Data',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: List<Widget>.generate(2, (index) => buildInputBox(context, index+1))
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: mainColor,
        onPressed: () {}, 
        label: Text('Kirim', style: whiteSubtitleBold,),
        elevation: 0,
        highlightElevation: 0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}