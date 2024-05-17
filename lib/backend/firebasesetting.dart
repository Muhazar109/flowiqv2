import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DataFetch extends StatefulWidget {
  const DataFetch({super.key});

  @override
  State<DataFetch> createState() => _DataFetchState();
}

class _DataFetchState extends State<DataFetch> {
  DatabaseReference ref = FirebaseDatabase.instance.ref('/dataSensor/');
  List<double> waterFlow = [];
  List<double> waterLevel = [];
  List<num> dataTime = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF33AAAA),
        iconTheme: IconThemeData(color: Colors.white),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(left: 10.0)),
            Text(
              "Data Grafik",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(20)),
          Text(
            "Debit",
            style: TextStyle(
              fontSize: 30,
            ),
            textAlign: TextAlign.center,
          ),
          Padding(padding: EdgeInsets.only(bottom: 20)),
          Expanded(
            child: FirebaseAnimatedList(
              query: ref,
              itemBuilder: (context, snapshot, animation, index) {
                var waterFlowValue = snapshot.child('waterFlow').value as num;
                var timeValue = waterFlow.length;
                waterFlow.add(waterFlowValue.toDouble());
                dataTime.add(timeValue);

                return Center(
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: LineChart(
                      LineChartData(
                        gridData: FlGridData(show: true),
                        titlesData: FlTitlesData(
                          topTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                            axisNameWidget: Column(
                              children: [Text('Debit ml/s ')],
                            ),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: true),
                            axisNameWidget: Column(
                              children: [
                                Text('second'),
                              ],
                            ),
                          ),
                        ),
                        borderData: FlBorderData(
                          show: false,
                          border:
                              Border.all(color: Color(0xff37434d), width: 1),
                        ),
                        minX: 0,
                        maxX: waterFlow.length.toDouble(),
                        minY: 0,
                        maxY: 500,
                        lineBarsData: [
                          LineChartBarData(
                            spots: waterFlow.asMap().entries.map((entry) {
                              return FlSpot(entry.key.toDouble(), entry.value);
                            }).toList(),
                            isCurved: true,
                            color: Colors.blue,
                            dotData: FlDotData(show: false),
                            belowBarData: BarAreaData(show: true),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(padding: EdgeInsets.all(10)),
          Text(
            "Water Level",
            style: TextStyle(
              fontSize: 30,
            ),
            textAlign: TextAlign.center,
          ),
          Padding(padding: EdgeInsets.only(bottom: 20)),
          Expanded(
            child: FirebaseAnimatedList(
              query: ref,
              itemBuilder: (context, snapshot, animation, index) {
                var waterLevelValue = snapshot.child('waterLevel').value as num;
                var timeValue = waterFlow.length;
                waterLevel.add(waterLevelValue.toDouble());
                dataTime.add(timeValue);

                return Center(
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: LineChart(
                      LineChartData(
                        gridData: FlGridData(show: true),
                        titlesData: FlTitlesData(
                          topTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                            axisNameWidget: Column(
                              children: [Text('mikro meter')],
                            ),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: true),
                            axisNameWidget: Column(
                              children: [
                                Text('second'),
                              ],
                            ),
                          ),
                        ),
                        borderData: FlBorderData(
                          show: false,
                          border:
                              Border.all(color: Color(0xff37434d), width: 1),
                        ),
                        minX: 0,
                        maxX: waterLevel.length.toDouble(),
                        minY: 0,
                        maxY: 3000,
                        lineBarsData: [
                          LineChartBarData(
                            spots: waterLevel.asMap().entries.map((entry) {
                              return FlSpot(entry.key.toDouble(), entry.value);
                            }).toList(),
                            isCurved: true,
                            color: Colors.blue,
                            dotData: FlDotData(show: false),
                            belowBarData: BarAreaData(show: true),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: DataFetch(),
  ));
}
