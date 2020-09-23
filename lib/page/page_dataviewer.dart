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
        builder: (contextScaffold) => SingleChildScrollView(
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
                    Text('100.000', style: blackNumber,)
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
                        Text('Telah Pemilih', style: blackContentRegular,),
                        Text('50.000', style: blackNumber,)
                      ],
                    ),
                    const SizedBox(width: 30,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Belum Pemilih', style: blackContentRegular,),
                        Text('50.000', style: blackNumber,)
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
                      Text('${bloc.calons[index].suara}', style: blackNumber,)
                    ],
                  ),
                ))
              ),
              const SizedBox(height: 30,),
            ],
          ),
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

