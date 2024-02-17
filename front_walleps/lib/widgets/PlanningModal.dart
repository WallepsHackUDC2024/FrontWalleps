import 'package:flutter/material.dart';
import 'package:front_walleps/theme/themes.dart';
import '../../widgets/Scheduler.dart';
import '../models/device_scheduler.dart';

class PlanningModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
        side: BorderSide(color: AppThemes.tertiaryColor, width: 2.0),
      ),
      surfaceTintColor: AppThemes.lightBlackColor,
      child: Center(
        //TODO: Poner las variables correctas
        /*
        child: FutureBuilder<List<DeviceSchedule>>(
          future: userService.getSchedulerByUserId(demoUserId, true),
          builder: (context, scheduleSnapshot) {
            if (scheduleSnapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (scheduleSnapshot.hasError) {
              return Text("Error al obtener la programación");
            } else if (scheduleSnapshot.hasData) {
              return WeeklySchedule(
                  schedule: scheduleSnapshot.data!,
                  homeHours: user.home_hours,
                  homeDuration: user.home_duration);
            } else {
              return Text("No se encontró la programación del usuario");
            }
          },
        ),
        */
      ),
    );
  }
}
