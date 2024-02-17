import 'package:flutter/material.dart';
import '../../models/scheduleTask.dart'; // Asegúrate de que la ruta de importación es correcta
import '../../widgets/scheduleTask.dart'; // Ajusta la ruta de importación según sea necesario

class ScheduleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<ScheduledTask> tasks = [
      ScheduledTask(
          dayOfWeek: "Lunes", time: "14:00", description: "Poner la lavadora"),
      ScheduledTask(
          dayOfWeek: "Martes",
          time: "18:00",
          description: "Poner el lavavajillas"),
      // Añade más tareas aquí
    ];

    // Asume que deseas mostrar las tareas de un día específico, por ejemplo, el lunes
    List<ScheduledTask> mondayTasks =
        tasks.where((task) => task.dayOfWeek == "Lunes").toList();

    return Scaffold(
      appBar: AppBar(title: Text('Horario Semanal')),
      body: DailyScheduleGrid(
          tasks: mondayTasks,
          dayOfWeek: "Lunes"), // Usa el widget para el día específico
    );
  }
}
