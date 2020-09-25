part of 'page.dart';

class DataViewerPage extends Page<DataViewerBloc> {
  DataViewerPage({Key key}) : super(key: key);

  @override
  void dispose() {}

  @override
  void init() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: XTopBar(
        textTitle: 'Data Pilkada',
      ),
      body: Builder(
        builder: (contextScaffold) => FutureBuilder<List<Calon>>(
          future: bloc.getCalons(),
          builder: (context, snapshot) => (snapshot.hasData) ? SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                PieChart(
                  PieChartData(
                    centerSpaceRadius: 0,
                    sectionsSpace: 5,
                    sections: showingSections(),
                    borderData: FlBorderData(
                      show: false,
                    ),
                  )
                ),
                XBox(
                  borderColor: borderColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Total Pemilih', style: blackContentRegular,),
                      Text(convertCurr(bloc.totalSuara()), style: blackNumber,)
                    ],
                  ),
                ),
                const SizedBox(height: 30,),
                XBox(
                  borderColor: borderColor,
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Suara Sah', style: blackContentRegular,),
                          Text(convertCurr(bloc.totalSuaraSah()), style: blackNumber,)
                        ],
                      ),
                      const SizedBox(width: 30,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Suara Tidak Sah', style: blackContentRegular,),
                          Text(convertCurr(bloc.totalSuaraTidakSah()), style: blackNumber,)
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: List.generate(bloc.calons.length, (index) => XBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Calon ${bloc.calons[index].number}', style: blackSubtitleRegular,),
                        Text('${bloc.calons[index].totalSuara}', style: blackNumber,)
                      ],
                    ),
                  ))
                ),
                const SizedBox(height: 30,),
              ],
            ),
          ) : const Center(child: CircularProgressIndicator(),)
        ),
      ) 
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(3,
      (i) => PieChartSectionData(
        color: mainColor,
        value: 20.0 * (i+1),
        radius: 100,
        title: '',
      )
    );
  }
}

