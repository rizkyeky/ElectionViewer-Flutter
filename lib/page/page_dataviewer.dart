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
          future: _bloc.getCalons(),
          builder: (context, snapshot) => (snapshot.hasData) ? SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                PieChart(
                  PieChartData(
                    centerSpaceRadius: 0,
                    sectionsSpace: 0,
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
                      Text(convertCurr(_bloc.totalSuara()), style: blackNumber,)
                    ],
                  ),
                ),
                const SizedBox(height: 15,),
                XBox(
                  borderColor: borderColor,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Suara Sah', style: blackContentRegular,),
                            Text(convertCurr(_bloc.totalSuaraSah()), style: blackNumber,)
                          ],
                        ),
                      ),
                      const Expanded(child: SizedBox(width: 30,),),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Suara Tidak Sah', style: blackContentRegular,),
                            Text(convertCurr(_bloc.totalSuaraTidakSah()), style: blackNumber,)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: List.generate(_bloc.calons.length, (index) => XBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Calon ${_bloc.calons[index].number}', style: blackSubtitleRegular,),
                        Text('${_bloc.calons[index].totalSuara}', style: blackNumber,)
                      ],
                    ),
                  ))
                ),
                const SizedBox(height: 15,),
              ],
            ),
          ) : const Center(child: CircularProgressIndicator(),)
        ),
      ) 
    );
  }

  List<PieChartSectionData> showingSections() {
    final List<Color> colors = [mainColor, mainColor.withOpacity(0.75), mainColor.withOpacity(0.5)];
    
    final List<Calon> sortedCalon = _bloc.calons;
    sortedCalon.sort((item2, item1) => item1.totalSuara.compareTo(item2.totalSuara));

    return List.generate(_bloc.calons.length,
      (i) => PieChartSectionData(
        color: colors[i],
        value: sortedCalon[i].totalSuara.toDouble(),
        radius: (120 - ((i+1)*5)).toDouble(),
        title: '${sortedCalon[i].number}',
      )
    );
  }
}

