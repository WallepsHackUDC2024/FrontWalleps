import 'package:flutter/material.dart';
import '../models/scheduleTask.dart'; // Asegúrate de que la ruta de importación es correcta

class DailyScheduleGrid extends StatelessWidget {
  final List<ScheduledTask> tasks;
  final String dayOfWeek;

  DailyScheduleGrid({Key? key, required this.tasks, required this.dayOfWeek})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Filtrar tareas por día de la semana
    List<ScheduledTask> dailyTasks =
        tasks.where((task) => task.dayOfWeek == dayOfWeek).toList();

    // Crear filas para cada hora del día
    List<Widget> rows = List.generate(24, (hour) {
      // Encontrar tarea para esta hora, si existe
      var taskForHour = dailyTasks.firstWhere(
        (task) => task.time.startsWith("${hour.toString().padLeft(2, '0')}:"),
        orElse: () => ScheduledTask(
            dayOfWeek: dayOfWeek,
            time: '${hour.toString().padLeft(2, '0')}:00',
            description: ''),
      );

      return Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
        ),
        child: Row(
          children: [
            Expanded(
                flex: 1, child: Text('${hour.toString().padLeft(2, '0')}:00')),
            Expanded(flex: 3, child: Text(taskForHour.description)),
          ],
        ),
      );
    });

    return SingleChildScrollView(
      child: Column(children: rows),
    );
  }
}
