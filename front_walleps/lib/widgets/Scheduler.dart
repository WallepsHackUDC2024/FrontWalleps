import 'package:flutter/material.dart';
import '../models/device_scheduler.dart';

class WeeklySchedule extends StatelessWidget {
  final List<DeviceSchedule> schedule;
  final int homeHours;
  final int homeDuration;
  WeeklySchedule(
      {super.key,
      required this.schedule,
      required this.homeHours,
      required this.homeDuration});

  // Los nombres de los días para los encabezados de la tabla
  final List<String> daysOfWeek = [
    "",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];

  @override
  Widget build(BuildContext context) {
    // Calculamos el rango de horas a mostrar
    List<int> displayHours =
        List.generate(homeDuration, (i) => (homeHours + i) % 24);

    // Matriz para representar la programación en la tabla, ajustada a las horas de interés
    List<List<String?>> scheduleMatrix =
        List.generate(8, (_) => List.generate(homeDuration, (_) => null));

    // Llenamos la matriz con la programación de los dispositivos
    for (var deviceSchedule in schedule) {
      for (int i = 0; i < deviceSchedule.timesWeek && i < 7; i++) {
        int timeIndex = displayHours.indexOf(deviceSchedule.time);
        if (timeIndex != -1) {
          // Si la hora del dispositivo está dentro del rango a mostrar
          scheduleMatrix[i + 1][timeIndex] = deviceSchedule.device;
        }
      }
    }

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns:
              daysOfWeek.map((day) => DataColumn(label: Text(day))).toList(),
          rows: List<DataRow>.generate(
            homeDuration,
            (index) => DataRow(
              cells: List<DataCell>.generate(
                8, // 7 días de la semana + 1 para las horas
                (dayIndex) => DataCell(
                  Text(dayIndex == 0
                      ? "${displayHours[index]}:00"
                      : scheduleMatrix[dayIndex][index] ?? ""),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
