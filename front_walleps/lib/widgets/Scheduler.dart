import 'package:flutter/material.dart';
import '../models/device_scheduler.dart';

class WeeklySchedule extends StatelessWidget {
  final List<DeviceSchedule> schedule;
  final int homeHours;
  final int homeDuration;

  WeeklySchedule({
    super.key,
    required this.schedule,
    required this.homeHours,
    required this.homeDuration,
  });

  List<List<String?>> _distributeDevicesUniformly() {
    List<List<String?>> matrix =
        List.generate(7, (_) => List.generate(homeDuration, (_) => null));
    List<int> hours = List.generate(homeDuration, (i) => (homeHours + i) % 24);

    // Para cada dispositivo en la programación
    for (var device in schedule) {
      int assignments = 0;
      int dayIndex = 0;
      // Trata de distribuir uniformemente las tareas durante los días disponibles
      while (assignments < device.timesWeek && dayIndex < 7) {
        int hourIndex = hours.indexOf(device.time);
        if (hourIndex != -1) {
          // Si la hora está dentro del rango a mostrar
          // Encuentra el próximo día disponible para esta tarea
          while (matrix[dayIndex][hourIndex] != null && dayIndex < 7 - 1) {
            dayIndex++;
          }
          if (matrix[dayIndex][hourIndex] == null) {
            // Si el día está libre en esa hora
            matrix[dayIndex][hourIndex] = device.device;
            assignments++;
          }
        }
        dayIndex = (dayIndex + 2) %
            7; // Salta un día para distribuir las tareas (ajusta este valor para cambiar la distribución)
      }
    }
    return matrix;
  }

  @override
  Widget build(BuildContext context) {
    List<List<String?>> scheduleMatrix = _distributeDevicesUniformly();

    return SingleChildScrollView(
      child: DataTable(
        columns: [
          "Hours",
          "Monday",
          "Tuesday",
          "Wednesday",
          "Thursday",
          "Friday",
          "Saturday",
          "Sunday"
        ].map((day) => DataColumn(label: Text(day))).toList(),
        rows: List.generate(
          homeDuration,
          (index) => DataRow(
            cells: [DataCell(Text("${(homeHours + index) % 24}:00"))] +
                List.generate(
                  7,
                  (dayIndex) =>
                      DataCell(Text(scheduleMatrix[dayIndex][index] ?? "")),
                ),
          ),
        ),
      ),
    );
  }
}
