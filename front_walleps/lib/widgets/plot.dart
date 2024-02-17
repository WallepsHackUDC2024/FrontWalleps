import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../theme/themes.dart'; // Asegúrate de que la ruta de importación es correcta

class PlotWithLegend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Widget de gráfico
    Widget chart = LineChart(
      LineChartData(
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(0, 1),
              FlSpot(1, 3),
              FlSpot(2, 2),
              FlSpot(3, 5),
              FlSpot(4, 3.5),
              FlSpot(5, 4),
              FlSpot(6, 6),
            ],
            isCurved: true,
            colors: [AppThemes.primaryColor],
            barWidth: 4,
            isStrokeCapRound: true,
            dotData: FlDotData(show: false),
            belowBarData: BarAreaData(show: false),
          ),
          // Línea correspondiente al Botón 2
          LineChartBarData(
            spots: [
              FlSpot(0, 3),
              FlSpot(1, 1),
              FlSpot(2, 4),
              FlSpot(3, 8),
              FlSpot(4, 6),
              FlSpot(5, 10),
              FlSpot(6, 8),
            ],
            isCurved: true,
            colors: [AppThemes.secondaryColor],
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
              FlSpot(6, 7),
            ],
            isCurved: true,
            colors: [AppThemes.greenColor],
            barWidth: 4,
            isStrokeCapRound: true,
            dotData: FlDotData(show: false),
            belowBarData: BarAreaData(show: false),
          ),
        ],
      ),
    );

    // Widget de leyenda
    Widget legend = Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          LegendItem(color: AppThemes.primaryColor, text: 'Botón 1'),
          LegendItem(color: AppThemes.secondaryColor, text: 'Botón 2'),
          LegendItem(color: AppThemes.greenColor, text: 'Botón 3'),
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
