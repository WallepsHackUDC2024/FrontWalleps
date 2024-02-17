import 'package:flutter/material.dart';
import '../models/device_scheduler.dart';

class WeeklySchedule extends StatelessWidget {
  final List<DeviceSchedule> schedule;
  WeeklySchedule({Key? key, required this.schedule}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Suponiendo que el horario secundario es Colors.amber
    const secondaryColor = Colors.amber;

    return SingleChildScrollView(
      child: Column(
        children: List.generate(7, (dayIndex) { // 7 días de la semana
          return Column(
            children: [
              Text("Día ${dayIndex + 1}"), // Título del día
              Column(
                children: List.generate(24, (hourIndex) { // 24 horas del día
                  // Busca dispositivos programados para esta hora
                  final devicesAtThisHour = schedule.where((device) =>
                      device.time == hourIndex &&
                      device.timesWeek > 0).toList(); // Simplificación

                  return Container(
                    height: 60, // Altura fija para cada hora
                    color: devicesAtThisHour.isNotEmpty ? secondaryColor : Colors.transparent,
                    child: Text(devicesAtThisHour.isNotEmpty ? devicesAtThisHour.first.device : ""),
                  );
                }),
              ),
            ],
          );
        }),
      ),
    );
  }
}
