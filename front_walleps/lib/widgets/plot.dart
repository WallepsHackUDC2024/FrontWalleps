import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../theme/themes.dart'; // Asegúrate de que la ruta de importación es correcta

class PlotWithLegend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget chart = LineChart(
      LineChartData(
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          // Línea correspondiente al Botón 1
          LineChartBarData(
            spots: [
              FlSpot(0, 2),
              FlSpot(1, 3),
              FlSpot(2, 2),
              FlSpot(3, 5),
              FlSpot(4, 3.5),
              FlSpot(5, 4),
              FlSpot(6, 3),
            ],
            isCurved: true,
            colors: [AppThemes.purpleColor],
            barWidth: 4,
            isStrokeCapRound: true,
            dotData: FlDotData(show: false),
            belowBarData: BarAreaData(show: false),
          ),
          // Línea correspondiente al Botón 2
          LineChartBarData(
            spots: [
              FlSpot(0, 3),
              FlSpot(1, 5),
              FlSpot(2, 4),
              FlSpot(3, 8),
              FlSpot(4, 6),
              FlSpot(5, 10),
              FlSpot(6, 6),
            ],
            isCurved: true,
            colors: [AppThemes.yellowColor],
            barWidth: 4,
            isStrokeCapRound: true,
            dotData: FlDotData(show: false),
            belowBarData: BarAreaData(show: false),
          ),
          // Línea correspondiente al Botón 3
          LineChartBarData(
            spots: [
              FlSpot(0, 4),
              FlSpot(1, 2),
              FlSpot(2, 5),
              FlSpot(3, 3),
              FlSpot(4, 4),
              FlSpot(5, 5),
              FlSpot(6, 4.5),
            ],
            isCurved: true,
            colors: [AppThemes.blueColor],
            barWidth: 4,
            isStrokeCapRound: true,
            dotData: FlDotData(show: false),
            belowBarData: BarAreaData(show: false),
          ),
        ],
      ),
    );
    Widget legend = Padding(
      padding: const EdgeInsets.only(top: 32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          LegendItem(color: AppThemes.purpleColor, text: 'Phone'),
          LegendItem(color: AppThemes.yellowColor, text: 'Electricity'),
          LegendItem(color: AppThemes.blueColor, text: 'Water Service'),
        ],
      ),
    );

    return Column(
      children: [
        Expanded(child: chart),
        legend,
      ],
    );
  }
}

class LegendItem extends StatelessWidget {
  final Color color;
  final String text;

  const LegendItem({Key? key, required this.color, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 4),
        Text(text),
      ],
    );
  }
}
